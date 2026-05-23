#!/usr/bin/env python3
"""
Split consolidated-glossary.csv into A-Z markdown files for research
and book writing.

Output: docs-glossary/az/a.md, docs-glossary/az/b.md, ..., docs-glossary/az/z.md
        docs-glossary/az/symbols.md (for non-alphabetic entries)

Usage:
    python3 scripts/split-glossary-az.py
"""

import csv
import os
import string
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
CSV_PATH = os.path.join(PROJECT_ROOT, "docs-glossary", "consolidated-glossary.csv")
AZ_DIR = os.path.join(PROJECT_ROOT, "docs-glossary", "az")


def read_csv():
    with open(CSV_PATH, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        return list(reader)


def group_by_letter(rows):
    """Group rows by first letter of english term."""
    groups = {}
    for row in rows:
        eng = row["english"].strip()
        if not eng:
            continue
        first = eng[0].upper()
        if first in string.ascii_uppercase:
            key = first
        else:
            key = "symbols"
        groups.setdefault(key, []).append(row)
    return groups


def write_md(letter, rows, output_path):
    """Write a single A-Z markdown file."""
    if letter == "symbols":
        title = "Symbols & Numbers"
        desc = "Terms starting with symbols, numbers, or special characters"
    else:
        title = letter
        desc = f"Terms starting with '{letter}'"

    lines = [
        f"# Tamil Computing & AI Glossary — {title}",
        "",
        f"> {desc}",
        f"> Total terms: {len(rows)}",
        "> Auto-generated from consolidated-glossary.csv",
        "",
        "| # | English | Primary Tamil (★) | Alternatives | Domain | Sources |",
        "|---|---------|-------------------|--------------|--------|---------|",
    ]

    for i, row in enumerate(rows, 1):
        eng = row["english"].replace("|", "\\|")
        primary = (row.get("primary_tamil") or "").replace("|", "\\|")
        domain = row.get("domain", "general")
        sources = (row.get("sources") or "").replace("|", "\\|")

        all_alt = row.get("all_alternatives", "")
        if all_alt:
            alt_terms = []
            seen = set()
            for t in all_alt.split(","):
                t = t.strip()
                if t and t not in seen and t != row.get("primary_tamil", "").strip():
                    seen.add(t)
                    alt_terms.append(t)
            alt_str = " / ".join(alt_terms) if alt_terms else "—"
        else:
            alt_str = "—"
        alt_str = alt_str.replace("|", "\\|")

        lines.append(f"| {i} | {eng} | {primary} | {alt_str} | {domain} | {sources} |")

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")


def write_index(groups):
    """Write an index file linking to all A-Z files."""
    total = sum(len(rows) for rows in groups.values())
    lines = [
        "# Tamil Computing & AI Glossary — A-Z Index",
        "",
        f"> Total terms: {total}",
        "> Auto-generated from consolidated-glossary.csv",
        "",
        "| Letter | Terms | File |",
        "|--------|-------|------|",
    ]

    # Symbols first, then A-Z
    if "symbols" in groups:
        count = len(groups["symbols"])
        lines.append(f"| #/Symbols | {count} | [symbols.md](symbols.md) |")

    for letter in string.ascii_uppercase:
        if letter in groups:
            count = len(groups[letter])
            lines.append(f"| {letter} | {count} | [{letter.lower()}.md]({letter.lower()}.md) |")

    index_path = os.path.join(AZ_DIR, "README.md")
    with open(index_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"  Index: {index_path}")


def main():
    if not os.path.exists(CSV_PATH):
        print(f"ERROR: {CSV_PATH} not found.")
        sys.exit(1)

    rows = read_csv()
    print(f"Read {len(rows)} rows from CSV")

    groups = group_by_letter(rows)
    os.makedirs(AZ_DIR, exist_ok=True)

    for letter, letter_rows in sorted(groups.items()):
        if letter == "symbols":
            filename = "symbols.md"
        else:
            filename = f"{letter.lower()}.md"
        output_path = os.path.join(AZ_DIR, filename)
        write_md(letter, letter_rows, output_path)
        print(f"  {filename}: {len(letter_rows)} terms")

    write_index(groups)
    print(f"\nDone. Files written to {AZ_DIR}/")


if __name__ == "__main__":
    main()
