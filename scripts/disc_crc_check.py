#!/usr/bin/env python3
"""Check the disc reads the port made against the disc image.

usage: disc_crc_check.py IMAGE REPORT OUT

The engine logs every read of the disc as '[disc] read lsn L count C crc X' (X is
the CRC-32 of the C 2048-byte sectors it gave). The same sectors of IMAGE must give
the same CRC-32. Each read that does not is listed with the sector offset d (within
+-256 sectors) at which the image does give that CRC - a read that is off by d
sectors points at the sector arithmetic; no offset means the data itself differs.
Writes OUT and prints it. Always exits 0: the check reports, it does not gate.
"""
import os
import re
import sys
import zlib

SECTOR = 2048
LINE = re.compile(r"^\[disc\] read lsn (\d+) count (\d+) crc ([0-9A-F]{8})\s*$", re.M)
SEARCH = 256


def crc_at(f, sector, count, size):
    if sector < 0 or sector + count > size // SECTOR:
        return None
    f.seek(sector * SECTOR)
    return "%08X" % (zlib.crc32(f.read(count * SECTOR)) & 0xFFFFFFFF)


def main():
    image, report, out = sys.argv[1], sys.argv[2], sys.argv[3]
    lines = []
    with open(report, "r", errors="replace") as r:
        for m in LINE.finditer(r.read()):
            lines.append((int(m.group(1)), int(m.group(2)), m.group(3)))
    size = os.path.getsize(image)
    same = past = 0
    wrong = []
    seen = set()
    with open(image, "rb") as f:
        for lsn, count, crc in lines:
            if (lsn, count, crc) in seen:
                continue
            seen.add((lsn, count, crc))
            mine = crc_at(f, lsn, count, size)
            if mine is None:
                past += 1
            elif mine == crc:
                same += 1
            else:
                found = None
                for d in range(-SEARCH, SEARCH + 1):
                    if d and crc_at(f, lsn + d, count, size) == crc:
                        found = d
                        break
                wrong.append((lsn, count, crc, mine, found))
    text = ["the port's disc reads against the image (%s)" % os.path.basename(image),
            "distinct reads %d: same %d, different %d, past the image's end %d"
            % (len(seen), same, len(wrong), past)]
    for lsn, count, crc, mine, found in wrong[:60]:
        where = ("the port gave the image's sectors at lsn %d (offset %+d)" % (lsn + found, found)
                 if found is not None else "no offset within +-%d sectors" % SEARCH)
        text.append("  lsn %d count %d: port %s, image %s; %s" % (lsn, count, crc, mine, where))
    if not seen:
        text.append("no [disc] read lines in the report")
    with open(out, "w") as o:
        o.write("\n".join(text) + "\n")
    print("\n".join(text))


if __name__ == "__main__":
    main()
