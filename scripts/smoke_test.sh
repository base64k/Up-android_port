#!/usr/bin/env bash
#
# The PC reference build, run headless: how far the port gets with the game.
# The Android build is the same code; this one runs on the CI's processor, so
# a failure here is a failure there too - and it says where the game stopped,
# which is what the porting work needs.
#
#   scripts/smoke_test.sh            # build and run
#   UP_SMOKE_SECONDS=180 scripts/smoke_test.sh
#   UP_SMOKE_ROUNDS=4 scripts/smoke_test.sh
#
# The run's own report (games/up/build/port/report.txt) says why it stopped:
# an unimplemented syscall, a device register, a VIF or GS feature.
#
# The loop: a game copies code at run time that the analysis never saw (the
# overlays do). The run writes that code down (--discover); it is translated
# and the game is run again, until a run finds nothing new. The APK's stage
# then builds the dispatch table with all of it in.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

GAME="games/up"
SECONDS_TO_RUN="${UP_SMOKE_SECONDS:-300}"
ROUNDS="${UP_SMOKE_ROUNDS:-3}"
JOBS="${UP_JOBS:-$(nproc 2>/dev/null || echo 2)}"
BUILD="$GAME/build/linux/up"
GENERATED="$GAME/build/port/generated"
REPORT="$GAME/build/port/report.txt"
DISCOVERED="$GAME/build/port/discovered.txt"

log()  { printf '\033[1;34m[smoke]\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[smoke]\033[0m %s\n' "$*"; }

ELF="$GAME/extracted/$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["executable"])' "$GAME/game.json")"
[ -f "$ELF" ] || { warn "no program extracted ($ELF) - run the extract stage first"; exit 1; }

# The dispatch table: the lifted functions, and the code the runs have found.
write_dispatch() {
    python3 - <<'PY'
import sys
sys.path[:0] = ["engine/tools", "engine"]
from ps2decomp import game as game_config
import port
game = game_config.load("games/up")
print(port.generate(game))
PY
}

# How many different places the runs have found code at.
discovered_count() {
    if [ ! -f "$DISCOVERED" ]; then echo 0; return; fi
    local n
    n="$(sort -u "$DISCOVERED" | grep -c . || true)"
    echo "${n:-0}"
}

# clang 19 or later: the VU code's calling convention (preserve_none) needs it.
CXX="clang++"
if command -v clang++-19 >/dev/null 2>&1; then CXX="clang++-19"; fi
CC="clang"
if command -v clang-19 >/dev/null 2>&1; then CC="clang-19"; fi

# The host's build tools (the APK's stage made them): this build takes them
# too, so the shaders' compiler is not built a second time and SDL's sources
# are not fetched again. Both are only read, never written to.
HOST_BUILD="$GAME/build/port/cmake"
CACHE_ARGS=()
if [ -x "$HOST_BUILD/_deps/glslang-build/StandAlone/glslang" ]; then
    CACHE_ARGS+=("-DPS2_HOST_GLSLANG=$HOST_BUILD/_deps/glslang-build/StandAlone/glslang")
fi
if [ -d "$HOST_BUILD/_deps/sdl3-src" ]; then
    CACHE_ARGS+=("-DFETCHCONTENT_SOURCE_DIR_SDL3=$HOST_BUILD/_deps/sdl3-src")
fi

build_reference() {
    mkdir -p "$GAME/build/smoke"
    local log="$GAME/build/smoke/build.log"
    if ! cmake -S "$GAME/port" -B "$BUILD" -G Ninja -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
          -DPS2_GENERATED_DIR="$PWD/$GENERATED" -DPS2HOST_AVX2=OFF \
          ${CACHE_ARGS[@]+"${CACHE_ARGS[@]}"} > "$log" 2>&1; then
        return 1
    fi
    if ! cmake --build "$BUILD" -j "$JOBS" --target up >> "$log" 2>&1; then
        return 1
    fi
    return 0
}

# The game's run: headless, with the pictures it draws.
run_game() {
    mkdir -p "$GAME/build/smoke/frames" "$(dirname "$REPORT")" "$(dirname "$DISCOVERED")"
    local -a headless=()
    command -v xvfb-run >/dev/null 2>&1 && headless=(xvfb-run -a)
    # The IOP's trace: every library call the game's own IOP modules make (the
    # sound driver's, what it asks of the host). On by default; UP_SMOKE_IOP_TRACE=0 turns it off.
    local -a iop_trace=()
    [ "${UP_SMOKE_IOP_TRACE:-1}" = "1" ] && iop_trace=(--iop-trace)
    # UP_SMOKE_VIRTUAL=1: the run's time is its own (--virtual-time): the same
    # pictures and the same stops every run, the time going on only as the
    # emulated machine runs. The real-time run is the default.
    local -a virtual=()
    [ "${UP_SMOKE_VIRTUAL:-0}" = "1" ] && virtual=(--virtual-time)
    # Every store to one guest address, with the calls that make it (its writer):
    # UP_SMOKE_WATCH=0x007A982C, for a wait on a flag (or 0x007A982C,0x00795F94). Logged as "[write]" lines.
    # Several addresses separated by commas (or spaces): one --watch-write each.
    local -a watch=() w
    for w in ${UP_SMOKE_WATCH//,/ }; do watch+=(--watch-write "$w"); done
    set +e
    SDL_VIDEODRIVER=dummy PS2HOST_RENDERER=sdl PS2HOST_RAM_DUMP="$GAME/build/smoke/port-ram.bin" \
        "${headless[@]+"${headless[@]}"}" "$BUILD/up" "$ELF" \
            --disc "${UP_ISO:-disc/up.iso}" --no-memcard \
            --audio ${iop_trace[@]+"${iop_trace[@]}"} ${watch[@]+"${watch[@]}"} ${virtual[@]+"${virtual[@]}"} \
            --timeout "$SECONDS_TO_RUN" --frames "$GAME/build/smoke/frames" \
            --frames-every 1 --frames-limit 20 --discover "$DISCOVERED" \
            > "$REPORT" 2>&1
    CODE=$?
    set -e
    return 0
}

CODE=0
BEFORE=0
for ROUND in $(seq 1 "$ROUNDS"); do
    log "round $ROUND of $ROUNDS: the dispatch table"
    if ! write_dispatch; then warn "the dispatch table could not be written"; break; fi

    log "round $ROUND of $ROUNDS: the PC reference build (clang, $JOBS jobs)"
    if ! build_reference; then
        warn "the PC reference build failed (the log: $GAME/build/smoke/build.log)"
        break
    fi

    log "round $ROUND of $ROUNDS: the game, headless, for ${SECONDS_TO_RUN}s"
    run_game

    FOUND="$(discovered_count)"
    if [ "$FOUND" -le "$BEFORE" ]; then
        log "round $ROUND: nothing new found at run time ($FOUND places)"
        break
    fi
    log "round $ROUND: $FOUND places with code copied at run time ($BEFORE before): translating them"
    BEFORE="$FOUND"
done

log "the run ended with the code $CODE; its report:"
SUMMARY="$GAME/build/smoke/summary.txt"
{
    echo "the run ended with the code $CODE"
    echo "the places with code copied at run time: $(discovered_count)"
    echo
    if [ -f "$REPORT" ]; then
        sed -n '/=== host report ===/,$p' "$REPORT" | head -120
    elif [ -f "$GAME/build/smoke/build.log" ]; then
        echo "the game did not run: the build failed. Its log's end:"
        tail -40 "$GAME/build/smoke/build.log"
    else
        echo "no host report and no build log"
    fi
    echo
    echo "the pictures: $(ls "$GAME/build/smoke/frames" 2>/dev/null | wc -l)"
} > "$SUMMARY"
cat "$SUMMARY"
log "the full log: $REPORT"
