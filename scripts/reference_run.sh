#!/usr/bin/env bash
#
# The reference run: the original game on PCSX2 (the official Linux AppImage),
# with the player's own BIOS dump (bios/, from scripts/fetch_bios.sh) and the
# player's own disc (disc/up.iso, from scripts/fetch_disc.sh). It shows what
# the real console does - the screens the port has to reach - and its EE / IOP
# console output is the first thing to compare the port's trace with.
#
#   scripts/reference_run.sh           # needs bios/ and disc/up.iso
#   UP_REFERENCE_SECONDS=900 scripts/reference_run.sh
#
# Output (reference/ - git-ignored, and only ci-results/reference/ is kept):
#   reference/shots/t<seconds>.png   screenshots of the whole display
#   reference/logs/pcsx2.log         the emulator's output (EE and IOP consoles)
#   reference/logs/xvfb.log          the virtual display
# The screenshots are the game's pictures: they are artifacts only, never
# committed. The BIOS is copied into reference/ and never printed.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

VERSION="${PCSX2_VERSION:-v2.8.2}"
ASSET="pcsx2-${VERSION}-linux-appimage-x64-Qt.AppImage"
URL="https://github.com/PCSX2/pcsx2/releases/download/${VERSION}/${ASSET}"
SECONDS_TOTAL="${UP_REFERENCE_SECONDS:-600}"
DISC="$REPO_ROOT/disc/${UP_DISC_IMAGE:-up.iso}"
REF="$REPO_ROOT/reference"

log() { printf '\033[1;34m[reference]\033[0m %s\n' "$*"; }
die() { printf '\033[1;31m[reference]\033[0m %s\n' "$*" >&2; exit 1; }

[ -f "$DISC" ] || die "no disc image at $DISC (run scripts/fetch_disc.sh)"

# ------------------------------------------------------------ the BIOS set ---
# The dump's own folder: the ROM0 with its ROM1, NVM, MEC and INF, as the
# dumper wrote them. PCSX2 reads the set from one folder.
ROM0="$(find "$REPO_ROOT/bios" -type f -iname '*.ROM0' | head -n 1 || true)"
[ -n "$ROM0" ] || die "no *.ROM0 under bios/ (run scripts/fetch_bios.sh with the secret set)"
BIOS_SRC="$(dirname "$ROM0")"

rm -rf "$REF"
mkdir -p "$REF/bios" "$REF/shots" "$REF/logs"
cp "$BIOS_SRC"/* "$REF/bios/"
BIOS_NAME="$(basename "$ROM0")"
log "BIOS set: $(ls "$REF/bios" | wc -l) files, main ROM $BIOS_NAME"

# ------------------------------------------------------------- the emulator ---
log "downloading PCSX2 $VERSION (the official Linux build)"
curl -fL --retry 3 --retry-delay 5 -o "$REF/$ASSET" "$URL" || die "the PCSX2 download failed"
chmod +x "$REF/$ASSET"
(cd "$REF" && "./$ASSET" --appimage-extract >/dev/null)
APP="$REF/squashfs-root"
BINDIR="$APP/usr/bin"
[ -x "$APP/AppRun" ] || die "no AppRun in the extracted AppImage"

# Portable mode: the settings and the BIOS live next to the binary.
touch "$BINDIR/portable.txt"
mkdir -p "$BINDIR/inis"
cat > "$BINDIR/inis/PCSX2.ini" <<EOF
[UI]
SettingsVersion = 1
SetupWizardIncomplete = false
ConfirmShutdown = false
StartPaused = false
PauseOnFocusLoss = false

[Folders]
Bios = $REF/bios

[Filenames]
BIOS = $BIOS_NAME

[EmuCore]
EnableFastBoot = true
# The state at the end of the run, written when PCSX2 shuts down (the stop
# below is a graceful one): the EE RAM as the game has it at that point.
SaveStateOnShutdown = true

[EmuCore/GS]
Renderer = 12

[Logging]
EnableEEConsole = true
EnableIOPConsole = true
EnableTimeStamps = true
EnableVerbose = true

[InputSources]
Keyboard = true
SDL = false
XInput = false

# The first controller on the keyboard: without these bindings the game gets
# no input at all (the log says so: "Controller 1 has no input bindings").
[Pad1]
Type = DualShock2
Up = Keyboard/Up
Down = Keyboard/Down
Left = Keyboard/Left
Right = Keyboard/Right
Start = Keyboard/Return
Select = Keyboard/Backspace
Cross = Keyboard/K
Circle = Keyboard/L
Square = Keyboard/J
Triangle = Keyboard/I
L1 = Keyboard/Q
R1 = Keyboard/E
L2 = Keyboard/1
R2 = Keyboard/3

[Audio]
OutputModule = nullout

[SPU2/Output]
OutputModule = nullout
EOF
log "settings written to $BINDIR/inis/PCSX2.ini"

# ------------------------------------------------------------- the sound ---
# PCSX2 opens an audio stream at start-up; without a sound server it shows a
# modal error dialog ("Failed to create or configure audio stream") that takes
# all the keys. A PulseAudio server with a null sink gives it a device.
if command -v pulseaudio >/dev/null 2>&1; then
    pulseaudio --start --exit-idle-time=-1 --disallow-exit -n \
        --load="module-null-sink sink_name=null" --load="module-native-protocol-unix" >"$REF/logs/pulse.txt" 2>&1 || true
    sleep 2
    log "sound: $(pactl info 2>/dev/null | grep 'Default Sink' || echo 'no sink')"
else
    log "sound: no pulseaudio"
fi

# ------------------------------------------------------------- the display ---
export DISPLAY=:99
Xvfb :99 -screen 0 1280x1024x24 -nolisten tcp >"$REF/logs/xvfb.log" 2>&1 &
XVFB_PID=$!
sleep 3
kill -0 "$XVFB_PID" 2>/dev/null || die "Xvfb did not start (see $REF/logs/xvfb.log)"

# Send one key to the PCSX2 window. Without a window manager there is no
# activation, so the focus is set directly, then the key is sent (XTEST).
# The window: by the name, the class, the process id, or else the first visible
# window (the names are logged once, so a wrong guess shows up in the report).
find_window() {
    local wid=""
    wid="$(xdotool search --onlyvisible --name 'PCSX2' 2>/dev/null | head -n 1 || true)"
    [ -n "$wid" ] || wid="$(xdotool search --onlyvisible --class 'pcsx2' 2>/dev/null | head -n 1 || true)"
    [ -n "$wid" ] || wid="$(xdotool search --onlyvisible --pid "$PCSX2_PID" 2>/dev/null | head -n 1 || true)"
    [ -n "$wid" ] || wid="$(xdotool search --onlyvisible --name '.' 2>/dev/null | head -n 1 || true)"
    printf '%s' "$wid"
}

press() {
    local wid
    wid="$(find_window)"
    if [ -z "$wid" ]; then
        log "press $1: no window"
        return 0
    fi
    if [ -z "${WINDOWS_LOGGED:-}" ]; then
        log "windows: $(xdotool search --name '.' 2>/dev/null | while read -r w; do printf '[%s %s] ' "$w" "$(xdotool getwindowname "$w" 2>/dev/null)"; done)"
        log "chosen window: $wid ($(xdotool getwindowname "$wid" 2>/dev/null))"
        WINDOWS_LOGGED=1
    fi
    xdotool windowfocus "$wid" 2>/dev/null || true
    sleep 1
    if [ -z "${FOCUS_LOGGED:-}" ]; then
        log "focus: the window $wid has the focus: $(xdotool getwindowfocus 2>/dev/null || echo none)"
        FOCUS_LOGGED=1
    fi
    # Held for a moment (the game reads buttons per frame), then released.
    xdotool keydown "$1" 2>/dev/null || log "press $1: xdotool failed"
    sleep 0.4
    xdotool keyup "$1" 2>/dev/null || true
    log "pressed $1 at ${t:-?}s"
}

# ------------------------------------------------------------------ the run ---
log "starting PCSX2 with the disc, for ${SECONDS_TOTAL}s"
(cd "$APP" && exec ./AppRun -portable -batch -fastboot -- "$DISC") \
    >"$REF/logs/pcsx2.log" 2>&1 &
PCSX2_PID=$!

# The first minutes: the logos and the intro movies wait for Start, so the
# keys are pressed now and then (on the pad bound above). After that the game is
# left alone and the screens are the record.
t=0
while [ "$t" -lt "$SECONDS_TOTAL" ]; do
    sleep 1
    t=$((t + 1))
    if ! kill -0 "$PCSX2_PID" 2>/dev/null; then
        log "PCSX2 exited at ${t}s"
        break
    fi
    if [ $((t % 15)) -eq 0 ] && [ "$t" -ge 30 ] && [ "$t" -le 240 ]; then
        if [ $((t % 30)) -eq 0 ]; then press Return; else press k; fi
    fi
    if [ $((t % 60)) -eq 0 ]; then
        import -window root "$REF/shots/t${t}.png" 2>/dev/null || true
    fi
    if [ $((t % 15)) -eq 0 ]; then
        # Any error dialog of PCSX2: its window is read on its own.
        for ew in $(xdotool search --name '^Error$' 2>/dev/null || true); do
            import -window "$ew" "$REF/logs/error-$t.png" 2>/dev/null || true
            echo "== error window at ${t}s" >> "$REF/logs/error-text.txt"
            tesseract "$REF/logs/error-$t.png" - 2>/dev/null >> "$REF/logs/error-text.txt" || true
        done
    fi
done

if kill -0 "$PCSX2_PID" 2>/dev/null; then
    kill "$PCSX2_PID" 2>/dev/null || true
    # Give the graceful shutdown time to write the state (32 MiB, compressed).
    for _ in $(seq 1 90); do
        kill -0 "$PCSX2_PID" 2>/dev/null || break
        sleep 1
    done
    kill -9 "$PCSX2_PID" 2>/dev/null || true
    log "stopped PCSX2 after ${SECONDS_TOTAL}s"
fi
kill "$XVFB_PID" 2>/dev/null || true

# The EE RAM of the savestate: the words the port's stop points at, and which
# parts of RAM hold anything. Numbers only.
{
    echo "files under the PCSX2 folder (names and sizes):"
    find "$APP" -path '*/usr/bin/*' -newer "$REF/logs/xvfb.log" -type f -printf '%s %p\n' 2>/dev/null | grep -v '/usr/bin/lib' | head -n 60 || true
} > "$REF/logs/files.txt"
SAVE="$(find "$APP" -name '*.p2s' 2>/dev/null | sort | tail -n 1 || true)"
if [ -n "$SAVE" ]; then
    cp "$SAVE" "$REF/savestate.p2s"
    python3 "$REPO_ROOT/scripts/ee_snapshot.py" "$REF/savestate.p2s" \
        0x00795F70 0x00795F74 0x00795F78 0x00795F7C 0x00795F80 0x00795F84 0x00795F88 0x00795F8C \
        0x00795F90 0x00795F94 0x00795F98 0x00795F9C 0x00795FA0 0x00795F94 0x00714678 0x00076000 \
        0x00200008 0x002DD240 0x0032F250 0x00331230 0x0043E880 0x009E40B0 \
        --ranges > "$REF/logs/ee-snapshot.txt" 2>&1 || log "the savestate could not be read (see ee-snapshot.txt)"
    log "savestate read: $(wc -l < "$REF/logs/ee-snapshot.txt") lines"
else
    log "no savestate was written"
fi

# PCSX2's own log (the emulator's messages, the keys it received).
if [ -f "$BINDIR/logs/emulog.txt" ]; then
    tail -n 2000 "$BINDIR/logs/emulog.txt" > "$REF/logs/emulog-tail.txt"
fi

log "log lines: $(wc -l < "$REF/logs/pcsx2.log")"
log "screenshots: $(ls "$REF/shots" | wc -l)"
