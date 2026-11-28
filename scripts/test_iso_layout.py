#!/usr/bin/env python3
"""Round-trip test for iso_layout.py on a synthetic ISO9660 image (no game data).

Builds a small disc (system area with data, a root and a subdirectory, a file
that spans two sectors, a file in the root, and a non-file sector), extracts it,
then rebuilds the image from the extracted files, `.disc_layout` and `.disc_meta`
alone. The rebuilt image must equal the original byte for byte.

usage: python3 scripts/test_iso_layout.py
"""
import os
import struct
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import iso_layout as L  # noqa: E402

SECTOR = 2048


def dir_record(name, lba, size, is_dir):
    raw = name if isinstance(name, bytes) else name.encode('ascii')
    length = 33 + len(raw)
    if length % 2:
        length += 1
    rec = bytearray(length)
    rec[0] = length
    struct.pack_into('<I', rec, 2, lba)
    struct.pack_into('>I', rec, 6, lba)
    struct.pack_into('<I', rec, 10, size)
    struct.pack_into('>I', rec, 14, size)
    rec[25] = 2 if is_dir else 0
    rec[32] = len(raw)
    rec[33:33 + len(raw)] = raw
    return bytes(rec)


def dir_block(entries):
    data = bytearray()
    for rec in entries:
        if (len(data) % SECTOR) + len(rec) > SECTOR:  # records never span a sector
            data += bytes(SECTOR - len(data) % SECTOR)
        data += rec
    return bytes(data).ljust(SECTOR, b'\x00')


def build_iso():
    total = 24
    img = bytearray(total * SECTOR)
    img[5 * SECTOR:5 * SECTOR + 16] = b'SYSTEM AREA DATA'          # system area, not a file

    root_lba, mod_lba = 17, 18
    irx = bytes((i * 7 + 3) & 0xFF for i in range(3000))           # spans sectors 19-20
    cnf = b'BOOT2 = cdrom0:\\SLUS_218.64;1\r\nVER = 1.00\r\n'.ljust(100, b' ')

    pvd = bytearray(SECTOR)
    pvd[0] = 1
    pvd[1:6] = b'CD001'
    pvd[6] = 1
    struct.pack_into('<I', pvd, 80, total)                         # volume space size (layer 0)
    pvd[156:156 + 34] = dir_record(b'\x00', root_lba, SECTOR, True)
    img[16 * SECTOR:17 * SECTOR] = pvd

    root = dir_block([
        dir_record(b'\x00', root_lba, SECTOR, True),
        dir_record(b'\x01', root_lba, SECTOR, True),
        dir_record('SYSTEM.CNF;1', 21, len(cnf), False),
        dir_record('MODULES', mod_lba, SECTOR, True),
    ])
    img[root_lba * SECTOR:(root_lba + 1) * SECTOR] = root

    mods = dir_block([
        dir_record(b'\x00', mod_lba, SECTOR, True),
        dir_record(b'\x01', root_lba, SECTOR, True),
        dir_record('A.IRX;1', 19, len(irx), False),
    ])
    img[mod_lba * SECTOR:(mod_lba + 1) * SECTOR] = mods

    img[19 * SECTOR:19 * SECTOR + len(irx)] = irx
    img[21 * SECTOR:21 * SECTOR + len(cnf)] = cnf
    note = b'NOT A FILE'
    img[22 * SECTOR:22 * SECTOR + len(note)] = note              # a sector no file covers
    assert len(img) == total * SECTOR
    return bytes(img)


def main():
    original = build_iso()
    with tempfile.TemporaryDirectory() as tmp:
        iso = os.path.join(tmp, 'test.iso')
        out = os.path.join(tmp, 'out')
        with open(iso, 'wb') as f:
            f.write(original)

        files, layer1, meta = L.extract(iso, out)
        names = sorted(n for n, _, _ in files)
        assert names == ['MODULES/A.IRX', 'SYSTEM.CNF'], names
        assert layer1 == 0, layer1
        assert os.path.getsize(os.path.join(out, 'MODULES', 'A.IRX')) == 3000
        # Not covered by a file and not zero: the system area (5), the volume descriptor (16),
        # the root and MODULES directories (17, 18) and the note (22). Zero sectors are not kept.
        assert meta == 5, meta

        layout = open(os.path.join(out, '.disc_layout')).read().splitlines()
        assert layout[0] == 'sectors 24' and layout[1] == 'layer1 0', layout[:2]
        assert 'file 19 3000 MODULES/A.IRX' in layout, layout
        assert 'file 21 100 SYSTEM.CNF' in layout, layout

        # Rebuild the image from the extracted files and the layout, nothing else.
        rebuilt = bytearray(24 * SECTOR)
        for line in layout[2:]:
            _, lba, size, name = line.split(' ', 3)
            with open(os.path.join(out, *name.split('/')), 'rb') as f:
                data = f.read()
            assert len(data) == int(size), name
            rebuilt[int(lba) * SECTOR:int(lba) * SECTOR + len(data)] = data
        meta_raw = open(os.path.join(out, '.disc_meta'), 'rb').read()
        for i in range(0, len(meta_raw), 4 + SECTOR):
            lsn = struct.unpack_from('<I', meta_raw, i)[0]
            rebuilt[lsn * SECTOR:(lsn + 1) * SECTOR] = meta_raw[i + 4:i + 4 + SECTOR]
        diff = [s for s in range(24) if bytes(rebuilt[s*SECTOR:(s+1)*SECTOR]) != original[s*SECTOR:(s+1)*SECTOR]]
        assert not diff, f'rebuilt image differs from the original in sectors {diff}'
        assert bytes(rebuilt) == original
    print('iso_layout round trip: PASS (24 sectors rebuilt byte for byte)')
    return 0


if __name__ == '__main__':
    sys.exit(main())
