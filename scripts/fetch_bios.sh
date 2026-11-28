#!/usr/bin/env bash
#
# Fetch the PS2 BIOS dump from the player's own Google Drive file, unpack it and
# report what it is - for the reference trace (PCSX2 needs a BIOS dump from the
# owner's own console; it is not in the repository and never will be).
#
#   UP_BIOS_DRIVE_FILE_ID=<id> scripts/fetch_bios.sh
#
# Output: bios/bios.bin (the ROM) and bios/report.txt - the size and SHA-256 of
# every file in the dump, never their contents. bios/ is git-ignored.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

BIOS_FILE_ID="${UP_BIOS_DRIVE_FILE_ID:-}"
DIR="${UP_BIOS_DIR:-bios}"

log() { printf '\033[1;34m[bios]\033[0m %s\n' "$*"; }
die() { printf '\033[1;31m[bios]\033[0m %s\n' "$*" >&2; exit 1; }

[ -n "$BIOS_FILE_ID" ] || die "UP_BIOS_DRIVE_FILE_ID is not set"

mkdir -p "$DIR"
ARCHIVE="$DIR/bios-download"
UNPACKED="$DIR/unpacked"

if [ ! -s "$ARCHIVE" ]; then
    command -v gdown >/dev/null 2>&1 || python3 -m pip install --quiet --disable-pip-version-check gdown \
        || die "gdown is needed to read the Drive file"
    log "downloading the Drive file (the owner's BIOS dump)"
    gdown -O "$ARCHIVE" "https://drive.google.com/uc?id=$BIOS_FILE_ID" \
        || die "the download failed - the file must be shared (anyone with the link: reader)"
fi
[ -s "$ARCHIVE" ] || die "the download produced no file"

rm -rf "$UNPACKED"
mkdir -p "$UNPACKED"
MAGIC="$(head -c 4 "$ARCHIVE" | od -An -tx1 | tr -d ' \n')"
case "$MAGIC" in
    504b0304*) unzip -q -o "$ARCHIVE" -d "$UNPACKED" ;;
    *) cp "$ARCHIVE" "$UNPACKED/bios.bin" ;;
esac

# The ROM: a PS2 BIOS is 4 MiB (0x400000 bytes). Anything else is reported.
# A PCSX2-style dump has the main ROM as *.ROM0 (the .DIFF, *.ROM1 and the DVD
# ROM are other files of the same size, so they are never picked here).
ROM="$(find "$UNPACKED" -type f -iname '*.ROM0' | head -n 1 || true)"
[ -n "$ROM" ] || ROM="$(find "$UNPACKED" -type f -size 4194304c ! -iname '*.DIFF' ! -iname '*.ROM1' | head -n 1 || true)"
[ -n "$ROM" ] || log "no 4 MiB file in the dump - see the report"
[ -n "$ROM" ] && cp "$ROM" "$DIR/bios.bin"

{
    echo "PS2 BIOS dump - report (sizes and hashes only; the contents are not printed)"
    echo "archive: $(stat -c %s "$ARCHIVE") bytes, magic $MAGIC"
    find "$UNPACKED" -type f | sort | while read -r f; do
        printf '%12s bytes  %s  %s\n' "$(stat -c %s "$f")" "$(sha256sum "$f" | cut -c1-64)" "${f#"$UNPACKED"/}"
    done
    if [ -n "$ROM" ]; then
        echo "rom: $(basename "$ROM") copied to $DIR/bios.bin"
    else
        echo "rom: none of 4 MiB found"
    fi
} > "$DIR/report.txt"

cat "$DIR/report.txt"
