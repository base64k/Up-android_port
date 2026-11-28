#!/usr/bin/env python3
"""Compare the port's guest RAM with the reference's, page by page.

    scripts/ram_compare.py REFERENCE.p2s PORT_RAM.bin [--value WORD] [ADDR ...]

REFERENCE.p2s is a PCSX2 savestate (scripts/ee_snapshot.py reads its EE RAM);
PORT_RAM.bin is the EE's 32 MiB as the port's run left it (PS2HOST_RAM_DUMP).

Prints numbers and addresses only: how many 4 KiB pages differ, the runs of
differing pages, the first differing words of each run, and the words at the
given addresses on both sides. The game's pictures and code never appear.
"""

import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ee_snapshot  # noqa: E402

PAGE = 4096
RAM = 32 * 1024 * 1024


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    ref = ee_snapshot.find_ram(argv[1])
    with open(argv[2], "rb") as f:
        port = f.read()
    if len(ref) < RAM or len(port) < RAM:
        raise SystemExit(f"short RAM: reference {len(ref)}, port {len(port)} bytes")
    ref = ref[:RAM]
    port = port[:RAM]

    diff_pages = []
    for p in range(0, RAM, PAGE):
        if ref[p:p + PAGE] != port[p:p + PAGE]:
            diff_pages.append(p)
    print(f"pages differing: {len(diff_pages)} of {RAM // PAGE}")

    runs = []
    for p in diff_pages:
        if runs and runs[-1][1] == p:
            runs[-1][1] = p + PAGE
        else:
            runs.append([p, p + PAGE])
    print(f"runs of differing pages: {len(runs)}")
    for start, end in runs[:120]:
        words = []
        for a in range(start, end, 4):
            if ref[a:a + 4] != port[a:a + 4] and len(words) < 3:
                words.append(
                    f"0x{a:08X} ref=0x{struct.unpack_from('<I', ref, a)[0]:08X} "
                    f"port=0x{struct.unpack_from('<I', port, a)[0]:08X}"
                )
        print(f"  0x{start:08X}..0x{end:08X}: " + "; ".join(words))
    if len(runs) > 120:
        print(f"  ... {len(runs) - 120} more runs")

    # --value V: where the word V sits in the port's RAM, and what the reference
    # holds there. The port's bad pointer shows up as a value; this finds the slot.
    args = list(argv[3:])
    if "--value" in args:
        i = args.index("--value")
        want = int(args[i + 1], 16)
        del args[i:i + 2]
        hits = [a for a in range(0, RAM - 3, 4) if struct.unpack_from("<I", port, a)[0] == want]
        print(f"port RAM words equal to 0x{want:08X}: {len(hits)}")
        for a in hits[:40]:
            r = struct.unpack_from("<I", ref, a)[0]
            print(f"  0x{a:08X}: reference 0x{r:08X}")
        if len(hits) > 40:
            print(f"  ... {len(hits) - 40} more")

    for a in args:
        addr = int(a, 16) & 0x1FFFFFFF
        if addr + 4 > RAM:
            print(f"{a}: outside the main RAM")
            continue
        r = struct.unpack_from("<I", ref, addr)[0]
        q = struct.unpack_from("<I", port, addr)[0]
        print(f"0x{addr:08X} ref=0x{r:08X} port=0x{q:08X}{'' if r == q else '  DIFFERENT'}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
