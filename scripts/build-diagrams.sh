#!/bin/bash
# Render Mermaid .mmd files to SVG for the Tamil AI Glossary book
# Usage: ./scripts/build-diagrams.sh [chapter-prefix|all]
#
# Examples:
#   ./scripts/build-diagrams.sh          # all .mmd files
#   ./scripts/build-diagrams.sh 05       # only 05-*.mmd files
#   ./scripts/build-diagrams.sh all      # all .mmd files

set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIAGRAM_DIR="$REPO_ROOT/book/diagrams"
MERMAID_CONFIG="$REPO_ROOT/scripts/mermaid-config.json"

if [ ! -d "$DIAGRAM_DIR" ]; then
  echo "Error: diagrams directory not found at $DIAGRAM_DIR"
  exit 1
fi

if [ ! -f "$MERMAID_CONFIG" ]; then
  echo "Error: mermaid config not found at $MERMAID_CONFIG"
  exit 1
fi

target="${1:-all}"

if [ "$target" = "all" ]; then
  pattern="*.mmd"
else
  pattern="${target}-*.mmd"
fi

mmd_count=$(find "$DIAGRAM_DIR" -maxdepth 1 -name "$pattern" | wc -l | tr -d ' ')
if [ "$mmd_count" -eq 0 ]; then
  echo "No .mmd files matching '$pattern' in $DIAGRAM_DIR"
  exit 0
fi

echo "Building $mmd_count diagram(s) matching '$pattern'..."

for mmd_file in "$DIAGRAM_DIR"/$pattern; do
  filename=$(basename "$mmd_file" .mmd)
  echo "  $filename.mmd → $filename.png"
  npx -y -p @mermaid-js/mermaid-cli mmdc \
    -i "$mmd_file" \
    -o "$DIAGRAM_DIR/$filename.png" \
    -c "$MERMAID_CONFIG" \
    -b transparent \
    --scale 3
done

echo "Done. $mmd_count diagram(s) built."
