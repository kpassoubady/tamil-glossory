#!/bin/bash
# Render Mermaid .mmd files to PNG and SVG (text-as-paths) for the Tamil AI Glossary book.
#
# PNG output is kept for backward compatibility (current .md files reference .png).
# SVG output uses a PDF intermediate so Chromium shapes Tamil text correctly into
# vector glyph outlines, which pdf2svg then converts to <path> elements. WeasyPrint
# renders the resulting SVG perfectly (no font-shaping at PDF time).
#
# Usage: ./scripts/build-diagrams.sh [chapter-prefix|all] [--png|--svg|--both]
#
# Examples:
#   ./scripts/build-diagrams.sh                    # all .mmd files, both formats
#   ./scripts/build-diagrams.sh 05                 # only 05-*.mmd files, both formats
#   ./scripts/build-diagrams.sh all --svg          # all .mmd files, SVG only
#   ./scripts/build-diagrams.sh 05 --png           # only 05-*.mmd, PNG only
#
# Dependencies:
#   - npx (for mermaid-cli)
#   - pdf2svg (macOS: brew install pdf2svg | Linux: apt install pdf2svg)

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

target="all"
format="both"
for arg in "$@"; do
  case "$arg" in
    --png) format="png" ;;
    --svg) format="svg" ;;
    --both) format="both" ;;
    *) target="$arg" ;;
  esac
done

if [ "$format" = "svg" ] || [ "$format" = "both" ]; then
  if ! command -v pdf2svg >/dev/null 2>&1; then
    echo "Error: pdf2svg not found. Install with:"
    echo "  macOS: brew install pdf2svg"
    echo "  Linux: apt install pdf2svg"
    exit 1
  fi
fi

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

echo "Building $mmd_count diagram(s) matching '$pattern' (format: $format)..."

for mmd_file in "$DIAGRAM_DIR"/$pattern; do
  filename=$(basename "$mmd_file" .mmd)
  outputs=""

  if [ "$format" = "png" ] || [ "$format" = "both" ]; then
    outputs="$filename.png"
    npx -y -p @mermaid-js/mermaid-cli mmdc \
      -i "$mmd_file" \
      -o "$DIAGRAM_DIR/$filename.png" \
      -c "$MERMAID_CONFIG" \
      -b transparent \
      --scale 3 >/dev/null
  fi

  if [ "$format" = "svg" ] || [ "$format" = "both" ]; then
    [ -n "$outputs" ] && outputs="$outputs + $filename.svg" || outputs="$filename.svg"
    tmp_dir=$(mktemp -d -t "mmd-XXXXXX")
    tmp_pdf="$tmp_dir/$filename.pdf"
    # Render via PDF so Chromium shapes Tamil correctly into Type-3 vector glyphs.
    # --pdfFit makes the page size match the chart content.
    npx -y -p @mermaid-js/mermaid-cli mmdc \
      -i "$mmd_file" \
      -o "$tmp_pdf" \
      -c "$MERMAID_CONFIG" \
      -b transparent \
      --pdfFit >/dev/null
    # Extract vector outlines: <text> → <path>. WeasyPrint then renders perfectly.
    pdf2svg "$tmp_pdf" "$DIAGRAM_DIR/$filename.svg"
    rm -rf "$tmp_dir"
  fi

  echo "  $filename.mmd → $outputs"
done

echo "Done. $mmd_count diagram(s) built."
