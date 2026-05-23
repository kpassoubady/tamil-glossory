# SVG Diagrams with Tamil Text

How Mermaid diagrams are rendered for this book, why SVG used to break for Tamil, and what to install so SVG builds keep working.

---

## TL;DR

- `scripts/build-diagrams.sh` produces **PNG** (default, used by `.md` files today) and/or **SVG with text-as-paths** (scalable vector, Tamil-correct).
- SVG output requires **`pdf2svg`** in addition to the existing **`mmdc`** (mermaid-cli) tooling.
- Install once: `brew install pdf2svg` (macOS) or `apt install pdf2svg` (Linux).
- Markdown files currently reference `.png`. Switching to `.svg` is optional and unblocked by this fix.

## The Problem We Solved

Mermaid renders SVG with `<text>` elements that reference fonts by name. When BookBuilder fed those SVGs to WeasyPrint, the Cairo renderer applied no complex-script shaping for Tamil — conjuncts (e.g. `செய்யறிவு`, `பண்பாட்டுணர்வுச்`) came out as tofu, broken ligatures, or mispositioned vowel marks.

Embedding the font into the SVG did not help. Cairo's shaper, not font availability, is the bottleneck.

Until 2026-05-23 we worked around this by rendering every diagram as a 3× PNG. PNG was Tamil-correct but not scalable and bloated the PDF.

## The Fix (Current Pipeline)

The build script now produces a Tamil-correct, scalable SVG by routing through a PDF intermediate:

```
.mmd
  └─ mmdc -o file.pdf --pdfFit
     (Chromium shapes Tamil into Type-3 vector glyphs)
        └─ pdf2svg file.pdf file.svg
           (Type-3 glyphs → SVG <path> elements)
              └─ WeasyPrint
                 (renders SVG paths perfectly, no shaping needed)
```

The trick is that Chromium ships HarfBuzz, which shapes Tamil correctly. By going through PDF, we capture the shaped output as vector outlines. `pdf2svg` then turns those outlines into SVG `<path>` elements. The final SVG contains **zero `<text>` elements** — only paths — so WeasyPrint has nothing left to shape.

Bookbuilder itself did not change. The fix lives entirely in [`scripts/build-diagrams.sh`](../scripts/build-diagrams.sh).

For the original investigation and verified results, see [bookbuilder/docs/issue-svg-tamil-rendering.md](https://github.com/kangs/bookbuilder/blob/main/docs/issue-svg-tamil-rendering.md) (in the bookbuilder repo). A native bookbuilder implementation of this same idea is designed in [bookbuilder/design/svg-complex-script-rendering.md](https://github.com/kangs/bookbuilder/blob/main/design/svg-complex-script-rendering.md) — when shipped, this project will no longer need its own diagram-build workaround.

## What to Install (One-Time Setup)

Required dependencies and how to install them on a fresh machine:

| Tool       | Purpose                                  | macOS                       | Linux                          | Check version          |
| ---------- | ---------------------------------------- | --------------------------- | ------------------------------ | ---------------------- |
| Node.js    | Runtime for mermaid-cli                  | `brew install node`         | `apt install nodejs npm`       | `node --version`       |
| `npx`      | Runs mermaid-cli without global install  | Included with Node.js       | Included with Node.js          | `npx --version`        |
| mermaid-cli| Renders `.mmd` → PNG / PDF               | Auto-installed by `npx`     | Auto-installed by `npx`        | `npx mmdc --version`   |
| `pdf2svg`  | Converts PDF → SVG (extracts glyph paths)| `brew install pdf2svg`      | `apt install pdf2svg`          | `pdf2svg` (no flag)    |

Verify everything is in place:

```bash
node --version          # any LTS, v18+ recommended
npx mmdc --version      # should print a mermaid-cli version (e.g. 11.x)
which pdf2svg           # should print a path
```

If `npx mmdc --version` is slow the first time, that's normal — npm is downloading mermaid-cli into its cache. Subsequent runs are fast.

## Usage

```bash
# Default — build both PNG and SVG for every .mmd
./scripts/build-diagrams.sh

# Limit to one chapter prefix
./scripts/build-diagrams.sh 05            # both formats
./scripts/build-diagrams.sh 05 --png      # PNG only (legacy)
./scripts/build-diagrams.sh 05 --svg      # SVG only

# All diagrams, SVG only (useful after switching .md files to .svg references)
./scripts/build-diagrams.sh all --svg
```

The script reads `scripts/mermaid-config.json` for theme and font settings — change Tamil fonts there, not in the script.

If `pdf2svg` is missing when SVG output is requested, the script fails fast with an install hint. PNG-only mode does not need `pdf2svg`.

## Verifying a Build Worked

After regenerating a diagram, two quick sanity checks:

```bash
# 1. The new SVG should contain <path> elements and NO <text> elements
grep -c "<text" book/diagrams/01-ai-levels.svg     # expect 0
grep -c "<path" book/diagrams/01-ai-levels.svg     # expect > 0

# 2. Build a single chapter PDF and visually confirm Tamil conjuncts render
#    (use whatever your normal bookbuilder build command is)
```

If `<text` count is anything other than 0, the conversion didn't happen — `pdf2svg` likely failed silently or wasn't on the PATH.

## Switching `.md` Files from PNG to SVG (Optional, Not Yet Done)

The chapter `.md` files currently reference `![alt](book/diagrams/foo.png)`. Migrating to SVG is a separate decision; nothing in the current fix requires it. When ready:

```bash
# 1. Regenerate every diagram as SVG
./scripts/build-diagrams.sh all --svg

# 2. Update markdown references (preview the changes first)
grep -rl 'diagrams/.*\.png' book/chapters/ \
  | xargs sed -i '' -E 's#(diagrams/[^)]+)\.png#\1.svg#g'

# 3. Rebuild the book and visually verify a sample of chapters
```

Pros of switching: scalable, slightly cleaner zoom in PDF readers, future-proof for EPUB/DOCX.
Cons: ~107 diagrams × ~150 KB each ≈ 16 MB more in the repo (until the PNG files are removed). PNGs can be deleted after the migration is verified.

## Future Maintenance

**When to rebuild diagrams**

- After editing any `.mmd` file: rebuild just that chapter (`./scripts/build-diagrams.sh <prefix>`).
- After updating `scripts/mermaid-config.json` (font stack, theme): rebuild all (`./scripts/build-diagrams.sh all`).
- After a major mermaid-cli version bump: run a full rebuild and visually spot-check a few diagrams. Mermaid layout can shift between versions; the script does not pin a version.

**Keeping the toolchain working**

- **Pin mermaid-cli only if you see layout drift between contributors.** The current script uses `npx -y -p @mermaid-js/mermaid-cli mmdc` (latest). For a fully reproducible build, replace with `@mermaid-js/mermaid-cli@<exact-version>`.
- **`pdf2svg` is stable** — it has had effectively no API change in years. No version pinning needed; system package manager is fine.
- **Node.js LTS** is sufficient. mermaid-cli needs a recent-ish Node (v18+).
- **Chromium is downloaded by mermaid-cli on first run** into its own cache (`~/.cache/ms-playwright/` or similar). If diagrams start failing with `protocol error` or `browser not found`, delete that cache and re-run; mermaid-cli will redownload.

**Things that will break the SVG output (and how to detect)**

| Symptom                                          | Likely cause                              | Fix                                    |
| ------------------------------------------------ | ----------------------------------------- | -------------------------------------- |
| Tamil glyphs are tofu / boxes in built SVG       | `mmdc` ran but `pdf2svg` not on PATH      | Install `pdf2svg`; re-run              |
| SVG contains `<text>` elements                   | Build skipped the PDF→SVG step            | Re-run with `--svg`; check script logs |
| Mermaid layout looks subtly different            | mermaid-cli auto-upgraded to a new major  | Pin a version in the script            |
| SVG file is 0 bytes or missing                   | `mmdc` failed (Chromium download issue)   | Run `npx mmdc -h` to trigger re-fetch  |
| `pdf2svg: command not found`                     | Homebrew/apt update removed the binary    | Reinstall (`brew install pdf2svg`)     |

**CI considerations** (if/when the book builds in CI)

The CI image needs Node.js, `pdf2svg`, and enough disk for mermaid-cli to download its bundled Chromium (~250 MB). Cache `~/.cache/ms-playwright/` between runs.

## Related Documents

- [`scripts/build-diagrams.sh`](../scripts/build-diagrams.sh) — the script itself
- [`scripts/mermaid-config.json`](../scripts/mermaid-config.json) — font stack and theme
- [bookbuilder issue doc](https://github.com/kangs/bookbuilder/blob/main/docs/issue-svg-tamil-rendering.md) — root-cause analysis (in the bookbuilder repo)
- [bookbuilder native-fix design](https://github.com/kangs/bookbuilder/blob/main/design/svg-complex-script-rendering.md) — when this lands, the workaround in this project becomes unnecessary
