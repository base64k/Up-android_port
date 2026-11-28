#!/usr/bin/env python3
"""Extract an ISO9660 PS2 disc and record where every file sits on the disc.

Why: the port reads the game's data from these files, each at its original
sector (the disc's own sector numbers are kept in `.disc_layout`), so the
game's disc reads (sceCdRead by LSN) are served from files and no drive or
CD-ROM driver model (cdvdman on the IOP) is needed. That model is where the
port's IOP stack was corrupted (docs/FINDINGS.md).

Output directory:
  <files>            the disc's files, by their names on the disc
  .disc_layout       text: `sectors N`, `layer1 L`, then `file LBA SIZE NAME`
  .disc_meta         binary: every non-zero sector that no file covers
                     (volume descriptors, directories, system area), as
                     <u32 LSN> + 2048 bytes, so the disc can be rebuilt exactly

Dual-layer discs: the second layer's volume descriptor sits at the layer-0
size; extents of layer 1 are relative to that sector minus 16 (as in the
ISO9660/UDF rules for DVD-9).

usage: iso_layout.py ISO OUTDIR [--list]

This is an independent implementation of the ISO9660 layout (no code copied).
"""
import os
import struct
import sys

SECTOR = 2048
PVD_LSN = 16


def _u32(b, o):
    return struct.unpack_from('<I', b, o)[0]


def _read_dir(f, lba, size, path, files, dirs, base):
    """Walk one directory; `base` is the layer's offset on the disc."""
    dirs.append((base + lba, size))
    f.seek((base + lba) * SECTOR)
    data = f.read(size)
    off = 0
    while off < len(data):
        rlen = data[off]
        if rlen == 0:  # a record never spans a sector: skip to the next one
            off = (off // SECTOR + 1) * SECTOR
            continue
        rec = data[off:off + rlen]
        off += rlen
        ext_lba, ext_len = _u32(rec, 2), _u32(rec, 10)
        flags = rec[25]
        name_len = rec[32]
        raw = rec[33:33 + name_len]
        if raw in (b'\x00', b'\x01'):  # '.' and '..'
            continue
        name = raw.decode('ascii', 'replace').split(';')[0]
        full = f'{path}/{name}' if path else name
        if flags & 2:  # directory
            _read_dir(f, ext_lba, ext_len, full, files, dirs, base)
        else:
            files.append((full, base + ext_lba, ext_len))


def _scan_layer(f, pvd_lsn, files, dirs, base):
    f.seek(pvd_lsn * SECTOR)
    pvd = f.read(SECTOR)
    if pvd[1:6] != b'CD001' or pvd[0] != 1:
        raise ValueError(f'no ISO9660 primary volume descriptor at sector {pvd_lsn}')
    root = pvd[156:156 + 34]
    _read_dir(f, _u32(root, 2), _u32(root, 10), '', files, dirs, base)
    return pvd


def scan(f):
    """Return (files, layer1). files: [(name, lsn, size)], lsn in disc sectors."""
    files, dirs = [], []
    pvd = _scan_layer(f, PVD_LSN, files, dirs, 0)
    layer0_sectors = _u32(pvd, 80)
    layer1 = 0
    f.seek(layer0_sectors * SECTOR)
    probe = f.read(SECTOR)
    if len(probe) == SECTOR and probe[1:6] == b'CD001' and probe[0] == 1:
        layer1 = layer0_sectors - PVD_LSN
        _scan_layer(f, layer0_sectors, files, dirs, layer1)
    return files, layer1


def write_layout(f, files, layer1, outdir):
    total = os.fstat(f.fileno()).st_size // SECTOR
    covered = sorted((lba, lba + (size + SECTOR - 1) // SECTOR) for _, lba, size in files)
    meta = []
    next_free = 0
    for start, end in covered + [(total, total)]:
        for s in range(next_free, start):
            f.seek(s * SECTOR)
            data = f.read(SECTOR)
            if any(data):
                meta.append((s, data))
        next_free = max(next_free, end)
    with open(os.path.join(outdir, '.disc_meta'), 'wb') as m:
        for s, data in meta:
            m.write(struct.pack('<I', s) + data)
    with open(os.path.join(outdir, '.disc_layout'), 'w', newline='\n') as m:
        m.write(f'sectors {total}\nlayer1 {layer1}\n')
        for name, lba, size in sorted(files, key=lambda e: e[1]):
            m.write(f'file {lba} {size} {name}\n')
    return len(meta)


def extract(iso, outdir, list_only=False):
    with open(iso, 'rb') as f:
        files, layer1 = scan(f)
        if list_only:
            for name, lba, size in files:
                print(f'{lba:8d} {size:12d} {name}')
            return files, layer1, 0
        os.makedirs(outdir, exist_ok=True)
        for name, lba, size in files:
            dst = os.path.join(outdir, *name.split('/'))
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            f.seek(lba * SECTOR)
            left = size
            with open(dst, 'wb') as o:
                while left:
                    chunk = f.read(min(left, 1 << 24))
                    if not chunk:
                        raise IOError(f'{iso}: short read in {name}')
                    o.write(chunk)
                    left -= len(chunk)
        meta = write_layout(f, files, layer1, outdir)
    return files, layer1, meta


def main(argv):
    args = [a for a in argv if not a.startswith('--')]
    if len(args) < 1 or (len(args) < 2 and '--list' not in argv):
        print(__doc__)
        return 2
    files, layer1, meta = extract(args[0], args[1] if len(args) > 1 else '', '--list' in argv)
    if '--list' not in argv:
        print(f'{len(files)} files, {meta} metadata sectors, layer1={layer1}')
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
