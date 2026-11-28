#!/usr/bin/env python3
"""Read the EE's main RAM out of a PCSX2 savestate (.p2s) and print what it holds.

A PCSX2 savestate is a zip archive; its "eeMemory.bin" entry is the 32 MiB of
the EE's main RAM. The entries may be zstd-compressed (method 93), which the
standard zipfile module cannot read, so the member is decompressed here.

    scripts/ee_snapshot.py SAVESTATE [ADDR ...] [--ranges]

Prints the entries found (name, sizes), the words at each given address (hex;
an address like 0x00795F80 or 0x795F80), and with --ranges a summary of which
4 KiB pages of RAM are not zero. Only numbers are printed - never the RAM.
"""

import struct
import sys
import zipfile

RAM_SIZE = 32 * 1024 * 1024


def read_member(path, info):
    """The member's bytes, decompressed (deflate by zipfile, zstd here)."""
    with zipfile.ZipFile(path) as z:
        if info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED):
            return z.read(info)
        fp = z.fp
        fp.seek(info.header_offset)
        header = fp.read(30)
        name_len, extra_len = struct.unpack("<HH", header[26:30])
        fp.seek(info.header_offset + 30 + name_len + extra_len)
        raw = fp.read(info.compress_size)
    if info.compress_type != 93:
        raise SystemExit(f"{info.filename}: unsupported compression {info.compress_type}")
    import zstandard  # pip install zstandard

    return zstandard.ZstdDecompressor().decompress(raw, max_output_size=info.file_size)


def find_ram(path):
    with zipfile.ZipFile(path) as z:
        infos = z.infolist()
    print("entries:")
    for info in infos:
        print(f"  {info.filename}  size={info.file_size}  compressed={info.compress_size}  method={info.compress_type}")
    for info in infos:
        if info.filename.lower().endswith("eememory.bin"):
            return read_member(path, info)
    raise SystemExit("no eeMemory.bin in the savestate")


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    path = argv[1]
    ranges = "--ranges" in argv
    addrs = [a for a in argv[2:] if a != "--ranges"]
    ram = find_ram(path)
    print(f"eeMemory: {len(ram)} bytes")
    if len(ram) < RAM_SIZE:
        raise SystemExit("eeMemory is shorter than the EE's 32 MiB")

    for a in addrs:
        addr = int(a, 16) & 0x1FFFFFFF
        if addr + 4 > RAM_SIZE:
            print(f"{a}: outside the main RAM (reads as 0 on the console's bus)")
            continue
        value = struct.unpack_from("<I", ram, addr)[0]
        print(f"0x{addr:08X} = 0x{value:08X}")

    if ranges:
        page = 4096
        nonzero = []
        for p in range(0, RAM_SIZE, page):
            if any(ram[p:p + page]):
                nonzero.append(p)
        print(f"non-zero pages: {len(nonzero)} of {RAM_SIZE // page}")
        # The runs of non-zero pages, as address ranges.
        runs = []
        for p in nonzero:
            if runs and runs[-1][1] == p:
                runs[-1][1] = p + page
            else:
                runs.append([p, p + page])
        for start, end in runs[:200]:
            print(f"  0x{start:08X}..0x{end:08X}")
        if len(runs) > 200:
            print(f"  ... {len(runs) - 200} more runs")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
