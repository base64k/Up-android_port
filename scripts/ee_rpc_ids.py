#!/usr/bin/env python3
"""Find where the EE program loads the SIF RPC ids the IOP side serves.

Reads the annotated assembly that `engine/tools/disasm.py --all -o DIR` writes
(one .s file per function) and tracks the constant each register holds, through
lui/addiu/ori, within a function. Where a register ends up holding one of the
RPC ids, it prints that function, the address, and the next few calls (jal)
after it: the registration or bind it is an argument to is the call that
follows. Output is plain text, for ci-results/ee-rpc-ids.txt.

    python3 scripts/ee_rpc_ids.py /tmp/ee-asm 0x01000002 0x01000001
"""
import glob
import os
import re
import sys

LINE = re.compile(r"^\s*([0-9a-fA-F]{8})\s+([a-z0-9._]+)\s+(.*?)\s*(#.*)?$")
REG = re.compile(r"^\$[a-z0-9]+$")
# Instructions that write their first operand (the destination), and a few
# that write nothing useful for this search.
WRITES_FIRST = {"addiu", "daddiu", "ori", "andi", "xori", "lui", "addu", "daddu",
                "subu", "dsubu", "or", "and", "xor", "nor", "slt", "sltu", "slti",
                "sltiu", "sll", "srl", "sra", "dsll", "dsll32", "dsrl", "dsrl32",
                "dsra", "dsra32", "lw", "lh", "lhu", "lb", "lbu", "ld", "lq", "lwl",
                "lwr", "movz", "movn", "mfc0", "mfc1", "mflo", "mfhi", "lwc1"}
CALL_CLOBBERS = ["$v0", "$v1", "$a0", "$a1", "$a2", "$a3", "$t0", "$t1", "$t2", "$t3",
                 "$t4", "$t5", "$t6", "$t7", "$t8", "$t9", "$at", "$ra"]
WINDOW = 12  # calls to report after a load


def u32(v):
    return v & 0xFFFFFFFF


def parse_imm(text):
    text = text.strip()
    try:
        return int(text, 0)
    except ValueError:
        return None


def scan(path, wanted):
    """Yield (address, value, following_calls) for each load of a wanted id."""
    name = os.path.basename(path)
    instrs = []
    for line in open(path, errors="replace"):
        m = LINE.match(line)
        if not m:
            continue
        addr, op, rest = m.group(1), m.group(2), m.group(3)
        ops = [o.strip() for o in rest.split(",")] if rest else []
        instrs.append((int(addr, 16), op, ops))
    vals = {}
    pending = []  # (addr, value, calls-so-far)
    for addr, op, ops in instrs:
        # Calls after a recorded load: collect the next few jal targets.
        still = []
        for rec in pending:
            if op == "jal" and ops:
                rec[2].append(ops[0])
            rec[3] -= 1
            if rec[3] > 0:
                still.append(rec)
            else:
                yield rec[0], rec[1], rec[2]
        pending = still
        value = None
        dest = None
        if op == "lui" and len(ops) == 2 and REG.match(ops[0]):
            imm = parse_imm(ops[1])
            if imm is not None:
                dest, value = ops[0], u32((imm & 0xFFFF) << 16)
        elif op in ("addiu", "ori", "daddiu") and len(ops) == 3 and REG.match(ops[0]):
            imm = parse_imm(ops[2])
            src = ops[1]
            base = 0 if src == "$zero" else vals.get(src)
            if imm is not None and base is not None:
                if op == "ori":
                    value = u32(base | (imm & 0xFFFF))
                else:
                    value = u32(base + imm)
                dest = ops[0]
        if op == "jal":
            for r in CALL_CLOBBERS:
                vals.pop(r, None)
        elif dest is None and op in WRITES_FIRST and ops and REG.match(ops[0]):
            vals.pop(ops[0], None)
        if dest is not None:
            vals[dest] = value
            if value in wanted:
                pending.append([addr, value, [], WINDOW])
    for rec in pending:
        yield rec[0], rec[1], rec[2]


def main(argv):
    folder = argv[1]
    wanted = {int(x, 0) for x in argv[2:]}
    rows = []
    for path in sorted(glob.glob(os.path.join(folder, "*.s"))):
        for addr, value, calls in scan(path, wanted):
            rows.append((os.path.basename(path)[:-2], addr, value, calls))
    print(f"functions scanned: {len(glob.glob(os.path.join(folder, '*.s')))}")
    print(f"loads of the wanted ids: {len(rows)}")
    for func, addr, value, calls in rows:
        print(f"{func}  0x{addr:08x}  id 0x{value:08x}  next calls: {' '.join(calls) or '-'}")


if __name__ == "__main__":
    main(sys.argv)
