#!/usr/bin/env python3
"""The lift.py --only arguments for one shard of the game's functions.

usage: verify_shard.py FUNCTIONS_JSON SHARD SHARDS

Every shard job runs this on the same functions.json, so the shards split the
functions the same way: function i (in address order) goes to shard i % SHARDS.
Prints e.g. "--only 0x003078A0 --only 0x003078F0 ...".
"""
import json
import sys


def address_of(function):
    value = function["addr"]
    return int(value, 16) if isinstance(value, str) else int(value)


def main():
    path, shard, shards = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
    if not 0 <= shard < shards:
        raise SystemExit("shard %d is not in 0..%d" % (shard, shards - 1))
    with open(path, encoding="utf-8") as handle:
        functions = json.load(handle)["functions"]
    addresses = sorted({address_of(f) for f in functions})
    mine = [a for i, a in enumerate(addresses) if i % shards == shard]
    print(" ".join("--only 0x%08X" % a for a in mine))
    print("shard %d of %d: %d of %d functions" % (shard, shards, len(mine), len(addresses)),
          file=sys.stderr)


if __name__ == "__main__":
    main()
