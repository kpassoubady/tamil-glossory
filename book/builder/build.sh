#!/usr/bin/env bash
# Build Tamil AI Glossary ebook
# Usage: ./build.sh [pdf|epub|docx]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
ORDER_FILE="$SCRIPT_DIR/book-order.json"
OUTPUT_DIR="$SCRIPT_DIR/output"
FORMAT="${1:-pdf}"

echo "Building Tamil AI Glossary ($FORMAT)..."
echo "  Root:   $ROOT_DIR"
echo "  Order:  $ORDER_FILE"
echo "  Output: $OUTPUT_DIR"
echo ""

bookbuilder build \
  --root "$ROOT_DIR" \
  --order "$ORDER_FILE" \
  --output-dir "$OUTPUT_DIR" \
  --format "$FORMAT" \
  --force

echo ""
echo "Done. Output in: $OUTPUT_DIR"
