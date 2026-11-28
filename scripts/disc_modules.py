#!/usr/bin/env python3
"""What the disc's own files say about the SIF RPC servers the port's trace names.

The IOP trace shows a sound module binding RPC server 0x01000002 and waiting for
it ("Check that ZnaSnd.irx have been loaded"); nothing in the port registers it.
This reads the disc's MODULES folder and the program, and reports for each file
the strings that name a sound module and where the server ids (as little-endian
words) appear in it. The report says which file can serve 0x01000002.

usage: disc_modules.py ISO EXTRACTED_DIR ENGINE_DIR OUT
"""
import os
import re
import struct
import subprocess
import sys

SERVERS = {"0x01000001": 0x01000001, "0x01000002": 0x01000002,
           "0x80000001": 0x80000001, "0x80000006": 0x80000006}
NAMES = re.compile(rb"(?i)zna|znasnd|cri_adx|libsd|sdrdrv|\.irx|sifrpc|sifcmd")

lines = []


def say(text=""):
    lines.append(text)


REG = ["zero", "at", "v0", "v1", "a0", "a1", "a2", "a3", "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
       "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "t8", "t9", "k0", "k1", "gp", "sp", "fp", "ra"]
IMM_OPS = {0x08: "addi", 0x09: "addiu", 0x0A: "slti", 0x0B: "sltiu", 0x0C: "andi", 0x0D: "ori",
           0x0E: "xori", 0x20: "lb", 0x21: "lh", 0x23: "lw", 0x24: "lbu", 0x25: "lhu", 0x28: "sb",
           0x29: "sh", 0x2B: "sw"}


def mips_text(word, address):
    """One R3000 instruction as text (the common ones; the rest as .word)."""
    op = word >> 26
    rs, rt, rd = (word >> 21) & 31, (word >> 16) & 31, (word >> 11) & 31
    sa, funct = (word >> 6) & 31, word & 63
    imm = word & 0xFFFF
    simm = imm - 0x10000 if imm & 0x8000 else imm
    if word == 0:
        return "nop"
    if op == 0:
        names = {0x21: "addu", 0x23: "subu", 0x25: "or", 0x24: "and", 0x26: "xor", 0x2A: "slt", 0x2B: "sltu"}
        if funct in names:
            return "%s %s,%s,%s" % (names[funct], REG[rd], REG[rs], REG[rt])
        if funct == 0x00:
            return "sll %s,%s,%d" % (REG[rd], REG[rt], sa)
        if funct == 0x02:
            return "srl %s,%s,%d" % (REG[rd], REG[rt], sa)
        if funct == 0x08:
            return "jr %s" % REG[rs]
        if funct == 0x09:
            return "jalr %s" % REG[rs]
        return ".word 0x%08X" % word
    if op in (0x02, 0x03):
        target = ((address + 4) & 0xF0000000) | ((word & 0x3FFFFFF) << 2)
        return ("j" if op == 0x02 else "jal") + " 0x%08X" % target
    if op == 0x0F:
        return "lui %s,0x%04X" % (REG[rt], imm)
    if op in (0x04, 0x05):
        target = address + 4 + (simm << 2)
        return ("beq" if op == 0x04 else "bne") + " %s,%s,0x%08X" % (REG[rs], REG[rt], target)
    if op in IMM_OPS:
        if op in (0x20, 0x21, 0x23, 0x24, 0x25, 0x28, 0x29, 0x2B):
            return "%s %s,%d(%s)" % (IMM_OPS[op], REG[rt], simm, REG[rs])
        return "%s %s,%s,%d" % (IMM_OPS[op], REG[rt], REG[rs], simm)
    return ".word 0x%08X" % word


def disasm_around(data, offset, before=8, after=4):
    """Lines of code around a file offset (aligned), with the address as the file gives it."""
    start = max(0, offset - 4 * before) & ~3
    out = []
    for at in range(start, min(len(data) - 3, offset + 4 * after + 4), 4):
        word = struct.unpack_from("<I", data, at)[0]
        mark = "  <- 0x01000002" if at <= offset < at + 4 else ""
        out.append("    0x%06X: %08X  %s%s" % (at, word, mips_text(word, at), mark))
    return out


def lui_ori_sites(data, hi, lo):
    """Offsets where MIPS code builds the word `hi<<16 | lo` with lui + ori/addiu
    (how a literal id reaches a register; a literal word in the code is rare)."""
    found = []
    words = struct.unpack_from("<%dI" % (len(data) // 4), data, 0)
    for i, w in enumerate(words):
        if (w >> 26) != 0x0F or ((w >> 21) & 0x1F) != 0 or (w & 0xFFFF) != hi:
            continue
        rt = (w >> 16) & 0x1F
        for j in range(i + 1, min(i + 4, len(words))):
            w2 = words[j]
            op = w2 >> 26
            if op in (0x0D, 0x09) and (w2 & 0xFFFF) == lo and ((w2 >> 21) & 0x1F) == rt:
                found.append(i * 4)
                break
    return found


def lui_wide_sites(data, hi, lo, span=12):
    """Offsets of `lui rt,hi` followed within `span` words by an addiu/ori/addi of
    `lo` on rt (the id built with other registers, or with more code between)."""
    found = []
    words = struct.unpack_from("<%dI" % (len(data) // 4), data, 0)
    for i, w in enumerate(words):
        if (w >> 26) != 0x0F or ((w >> 21) & 0x1F) != 0 or (w & 0xFFFF) != hi:
            continue
        rt = (w >> 16) & 0x1F
        for j in range(i + 1, min(i + 1 + span, len(words))):
            w2 = words[j]
            if (w2 >> 26) in (0x08, 0x09, 0x0D) and (w2 & 0xFFFF) == lo and ((w2 >> 21) & 0x1F) == rt:
                found.append(i * 4)
                break
    return found


def scan(path, label):
    with open(path, "rb") as f:
        data = f.read()
    say("== %s (%d bytes)" % (label, len(data)))
    names = []
    for m in re.finditer(rb"[\x20-\x7e]{4,}", data):
        if NAMES.search(m.group()):
            names.append(m.group().decode("ascii", "replace"))
    for name in names[:25]:
        say("  string: %s" % name)
    if len(names) > 25:
        say("  ... %d more strings" % (len(names) - 25))
    if len(data) >= 4:
        for hi_lo, name in (((0x0100, 0x0002), "0x01000002"), ((0x0100, 0x0001), "0x01000001")):
            sites = lui_ori_sites(data[: len(data) - len(data) % 4], *hi_lo)
            if sites:
                say("  code builds %s (lui+ori/addiu): %d times, first at %s" % (
                    name, len(sites), ", ".join("0x%X" % x for x in sites[:8])))
                for at in sites[:4]:
                    say("    code at 0x%X:" % at)
                    lines.extend(disasm_around(data, at, before=2, after=6))
            wide = lui_wide_sites(data[: len(data) - len(data) % 4], *hi_lo)
            say("  lui 0x%04X ... addiu/ori %d within 12 words: %d sites" % (
                hi_lo[0], hi_lo[1], len(wide)))
            for at in wide[:6]:
                say("    wide site 0x%X:" % at)
                lines.extend(disasm_around(data, at, before=2, after=10))
    # The module names an image carries (PsII<name>): an image of several
    # modules says which one holds a word, by the nearest name to it.
    names_at = [(m.start(), m.group().decode("ascii", "replace"))
                for m in re.finditer(rb"PsII[\x20-\x7e]{3,40}", data)]
    if names_at:
        say("  module names: " + "; ".join("%s at 0x%X" % (n.strip(), at) for at, n in names_at[:24]))
    for label_sid, sid in SERVERS.items():
        needle = struct.pack("<I", sid)
        hits = []
        at = data.find(needle)
        while at >= 0 and len(hits) < 8:
            hits.append(at)
            at = data.find(needle, at + 1)
        total = data.count(needle)
        if total:
            where = []
            for h in hits:
                near = min(names_at, key=lambda t: abs(t[0] - h))[1].strip() if names_at else "?"
                where.append("0x%X (near %s)" % (h, near))
            say("  word %s (LE): %d times, first at %s" % (label_sid, total, ", ".join(where)))
            if label_sid == "0x01000002" and "MODULES" in label:
                for h in hits[:3]:
                    say("  code around 0x%X:" % h)
                    lines.extend(disasm_around(data, h))


def walk(folder):
    found = []
    for root, _, files in os.walk(folder):
        for name in files:
            found.append(os.path.join(root, name))
    return sorted(found)


def main():
    iso, extracted, engine, out = sys.argv[1:5]
    work = os.path.join(os.path.dirname(out) or ".", "disc-modules")
    if not os.path.isfile(iso):
        say("no disc image at %s: nothing to scan" % iso)
    else:
        os.makedirs(work, exist_ok=True)
        tool = os.path.join(engine, "tools", "isotool.py")
        done = subprocess.run([sys.executable, tool, "extract", iso, "MODULES", "-o", work],
                              capture_output=True, text=True)
        say("isotool extract MODULES: exit %d %s" % (done.returncode,
                                                    (done.stderr or done.stdout).strip()[-300:]))
        for path in walk(work):
            scan(path, "MODULES/" + os.path.relpath(path, work))
    if os.path.isdir(extracted):
        for path in walk(extracted):
            scan(path, "program " + os.path.relpath(path, extracted))
    else:
        say("no extracted program in %s" % extracted)
    os.makedirs(os.path.dirname(out) or ".", exist_ok=True)
    with open(out, "w") as f:
        f.write("\n".join(lines[:4000]) + "\n")
    print("\n".join(lines[:200]))


if __name__ == "__main__":
    main()
