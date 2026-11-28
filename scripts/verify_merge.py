#!/usr/bin/env python3
"""Merge the shards' verification outcomes into one report.

usage: verify_merge.py SHARDS_DIR OUT_DIR

SHARDS_DIR holds one directory per shard, each with the lift_outcomes.json that
lift.py wrote for its functions ("0x%08X": outcome). Writes OUT_DIR/all-outcomes.json
(every outcome) and OUT_DIR/summary.txt: the counts, every function that
DISAGREES with the original (a translation bug, to fix by the same method), and the
ones the original cannot be run on (untestable).
"""
import collections
import glob
import json
import os
import re
import sys


def main():
    shards_dir, out_dir = sys.argv[1], sys.argv[2]
    merged, seen_in = {}, collections.Counter()
    for path in sorted(glob.glob(os.path.join(shards_dir, "**", "lift_outcomes*.json"), recursive=True)):
        with open(path, encoding="utf-8") as handle:
            for address, outcome in json.load(handle).items():
                merged[address] = outcome
                seen_in[address] += 1
    os.makedirs(out_dir, exist_ok=True)
    with open(os.path.join(out_dir, "all-outcomes.json"), "w", encoding="utf-8") as handle:
        json.dump(dict(sorted(merged.items())), handle, indent=0)

    tally = collections.Counter(re.sub(r"0x[0-9A-Fa-f]+|\b\d+\b", "N", o).split(":")[0]
                                for o in merged.values())
    lines = ["verification of the lifted functions, merged from %d shard(s)" % len(seen_in),
             "functions with an outcome: %d" % len(merged),
             "by outcome:"]
    for outcome, count in tally.most_common():
        lines.append("  %6d  %s" % (count, outcome))
    disagree = sorted(a for a, o in merged.items() if o.startswith("disagrees"))
    lines.append("")
    lines.append("DISAGREE with the original (%d): each is a translation bug to fix" % len(disagree))
    for address in disagree:
        lines.append("  %s  %s" % (address, merged[address][:300]))
    untest = sorted(a for a, o in merged.items() if o.startswith("untestable"))
    lines.append("")
    lines.append("untestable (%d): the original does not finish on the test cases" % len(untest))
    lines.append("  " + " ".join(untest[:200]))
    text = "\n".join(lines) + "\n"
    with open(os.path.join(out_dir, "summary.txt"), "w", encoding="utf-8") as handle:
        handle.write(text)
    print(text)


if __name__ == "__main__":
    main()
