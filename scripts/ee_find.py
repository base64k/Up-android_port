#!/usr/bin/env python3
"""Find EE code by what it does, over a whole-disc disassembly (disasm.py --all -o DIR).

Two searches, both over the .s files in DIR:

1. Deci2Call(0x10) - the kernel's kputs, which the engine turns into "[guest]"
   lines. A function is a candidate when it loads $a0 = 0x10 and syscall 0x7C
   ($v1 = 0x7C = Deci2Call) in the same body. Printed with its callers.

2. Loads and stores of a guest address range (default 0x795F80..0x795FA0, the
   ManipulatorMgr pointer and its neighbours). The base register's value is
   tracked through lui / addiu / ori / move / addu with an immediate, so an
   address built in a register is seen as well as a plain offset. The tracker
   is reset at every label and call, so each report line is a candidate to be
   read by hand, not a proof.

Usage: ee_find.py DIR [lo hi]
"""
import os
import re
import sys
from collections import defaultdict

LINE = re.compile(r"^\s*([0-9a-fA-F]{8})\s+(\S+)\s+(.*)$")
GLABEL = re.compile(r"^glabel\s+(\S+)")
MEM = re.compile(r"(-?0x[0-9a-fA-F]+|-?\d+)\((\$\w+)\)")
REG = re.compile(r"\$\w+")
STORES = {"sb", "sh", "sw", "sd", "sq", "swc1", "sdc1", "swl", "swr"}
LOADS = {"lb", "lbu", "lh", "lhu", "lw", "lwu", "ld", "lq", "lwc1", "ldc1", "lwl", "lwr"}
SIZE = {"sb": 1, "lb": 1, "lbu": 1, "sh": 2, "lh": 2, "lhu": 2, "sw": 4, "lw": 4, "lwu": 4,
        "swc1": 4, "lwc1": 4, "swl": 4, "swr": 4, "lwl": 4, "lwr": 4,
        "sd": 8, "ld": 8, "sdc1": 8, "ldc1": 8, "sq": 16, "lq": 16}


def num(s):
    return int(s, 0)


def functions(path):
    """Yield (name, [(addr, mnemonic, operands, text)]) per function in one file."""
    name = os.path.basename(path)[:-2]
    body = []
    with open(path, errors="replace") as f:
        for raw in f:
            m = GLABEL.match(raw.strip())
            if m:
                if body:
                    yield name, body
                name, body = m.group(1), []
                continue
            m = LINE.match(raw)
            if m:
                body.append((int(m.group(1), 16), m.group(2), m.group(3).split("#")[0].strip(), raw.rstrip()))
    if body:
        yield name, body


def track(body, lo, hi):
    """Yield (addr, kind, size, text, effective) for memory ops whose address is known."""
    val = {"$zero": 0}
    for addr, mn, ops, text in body:
        regs = REG.findall(ops)
        if mn in STORES or mn in LOADS:
            m = MEM.search(ops)
            if m and m.group(2) in val:
                eff = (val[m.group(2)] + num(m.group(1))) & 0xFFFFFFFF
                size = SIZE.get(mn, 4)
                if eff < hi and eff + size > lo:
                    yield addr, "store" if mn in STORES else "load", mn, text, eff
        if mn in ("jal", "jalr", "j", "jr", "syscall", "break"):
            if mn == "jal" or mn == "jalr":
                val = {"$zero": 0}
            continue
        if not regs:
            continue
        dst = regs[0]
        if dst == "$zero":
            continue
        if mn == "lui" and len(regs) == 1:
            val[dst] = (num(ops.split(",")[1].strip()) << 16) & 0xFFFFFFFF
        elif mn in ("addiu", "ori", "daddiu") and len(regs) == 2:
            imm = num(ops.split(",")[-1].strip())
            if regs[1] in val:
                base = val[regs[1]]
                val[dst] = ((base + imm) if mn != "ori" else (base | (imm & 0xFFFF))) & 0xFFFFFFFF
            else:
                val.pop(dst, None)
        elif mn in ("move", "addu") and len(regs) >= 2 and regs[1] in val and (mn == "move" or regs[2:3] == ["$zero"]):
            val[dst] = val[regs[1]]
        else:
            val.pop(dst, None)


def main():
    root = sys.argv[1]
    lo = num(sys.argv[2]) if len(sys.argv) > 3 else 0x795F80
    hi = num(sys.argv[3]) if len(sys.argv) > 3 else 0x795FA0
    # the Deci2Call wrapper (li $v1, 0x7C; syscall) and the call sites that set $a0 = 0x10
    # just before each jal to it: kputs.
    files = sorted(os.path.join(root, f) for f in os.listdir(root) if f.endswith(".s"))
    print(f"== {len(files)} functions in {root}")

    # 1. Deci2Call(0x10) - kputs
    print("\n== 1. Deci2Call (syscall 0x7C) wrappers, and the jal sites that set $a0 = 0x10 before them")
    wrappers = set()
    for path in files:
        for name, body in functions(path):
            text = "\n".join(t for *_, t in body)
            if re.search(r"addiu\s+\$v1,\s*\$zero,\s*0x7c\b", text):
                wrappers.add(name)
    print("  wrappers: " + (", ".join(sorted(wrappers)) or "none"))
    for path in files:
        for name, body in functions(path):
            for i, (addr, mn, ops, text) in enumerate(body):
                if mn == "jal" and ops.strip() in wrappers:
                    # the four instructions before the jal, and the delay slot
                    window = [b[3].strip() for b in body[max(0, i - 4):i + 2]]
                    if any(re.search(r"addiu\s+\$a0,\s*\$zero,\s*0x10\b", w) for w in window):
                        print(f"  {name} @ {addr:08x} calls {ops.strip()} with $a0 = 0x10 (kputs)")

    # 2. Loads and stores of the address range
    print(f"\n== 2. loads and stores of 0x{lo:08X}..0x{hi:08X} (base tracked through lui/addiu/ori)")
    for path in files:
        for name, body in functions(path):
            for addr, kind, mn, text, eff in track(body, lo, hi):
                print(f"  {kind:5s} {name} @ {addr:08x} -> 0x{eff:08X}: {text.strip()}")


if __name__ == "__main__":
    main()
