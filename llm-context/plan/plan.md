# Tamil AI Glossary — Improvement Plan

## Current State Assessment

The book has **10 chapters + 1 appendix + front matter**, covering 300+ AI terms. Each chapter is a **single flat table** with columns: English | Primary Tamil Word | Alternative Tamil Words | Notes / Explanation.

**Strengths already present:**
- Excellent Tamil word-root breakdowns (a + b + c etymology)
- Footnotes crediting the சொல்லாய்வு community
- Logical thematic grouping across chapters
- BookBuilder config already enables: admonitions (Tamil labels), blockquote lists, titled lists, footnotes

**What's missing:**
- No images or visual elements
- No chapter introductions beyond the title
- No learning objectives
- No concept relationships or grouping within chapters
- No knowledge checks or interactive elements
- No chapter summaries
- No callouts, tips, or "did you know?" highlights
- Terms sit in one long unbroken table per chapter

---

## Proposed Improvements

### 1. Chapter Hero Image

Add an AI-generated thematic illustration at the top of each chapter.

**Gemini prompt template:**

> Create a professional, clean illustration for a Tamil AI glossary book chapter on "[TOPIC]". Style: flat vector art with soft gradients, muted earth tones with deep green (#1a4d2e) accent color, no text overlays, 6x9 book-friendly aspect ratio. The image should visually represent the core concept of [TOPIC DESCRIPTION] in an abstract, elegant way. Include subtle Tamil cultural motifs (kolam patterns, temple geometry) woven into the technical imagery.

**Per-chapter prompt customizations:**

| Ch | Topic | Image concept |
|:---|:------|:--------------|
| 1 | AI Foundations | A tree of knowledge with roots labeled as algorithms branching into AI types — human brain and circuit board merging |
| 2 | Machine Learning | Data flowing through a funnel, transforming into patterns — scatter plot becoming organized clusters |
| 3 | Neural Networks | Interconnected nodes glowing in layers, inspired by kolam dot-grid patterns |
| 4 | Training & Optimization | A potter's wheel shaping a form — iterative refinement metaphor |
| 5 | Transformers & LLMs | Attention beams connecting words across a sentence, transformer architecture as a tower |
| 6 | NLP & Text Processing | Tamil script characters flowing through a processing pipeline, text becoming meaning |
| 7 | Embeddings & Search | Words floating as stars in a vector space, similar words clustering together |
| 8 | Prompting & Interaction | A person conversing with an AI — speech bubbles containing Tamil text |
| 9 | AI Agents & Tools | An orchestrator directing multiple specialized tools — robotic hands with different instruments |
| 10 | Safety & Ethics | A shield protecting data, balance scales representing fairness, guardrails on a path |
| A | Computing & Infra | Cloud servers, edge devices, and network connections forming a globe |

> **DECISION NEEDED:** Should the images follow a strictly uniform style (same color palette, same artist-style) or can each chapter have a unique visual flavor?

---

### 2. Chapter Introduction (2-3 paragraphs)

Add a brief bilingual introduction before the glossary table explaining:
- What this domain area is about
- Why these terms matter for Tamil AI practitioners
- How terms in this chapter connect to other chapters

**Example for Chapter 1:**

> செய்யறிவு (Artificial Intelligence) என்பது இன்று உலகின் அனைத்துத் துறைகளிலும் மாற்றத்தை ஏற்படுத்திக் கொண்டிருக்கிறது. இந்த அத்தியாயத்தில் செய்யறிவின் அடிப்படைக் கருத்துகள் — வகைகள், அணுகுமுறைகள், அடிப்படை மாதிரிகள் — ஆகியவற்றுக்கான கலைச்சொற்கள் தொகுக்கப்பட்டுள்ளன.

> **DECISION NEEDED:** Should introductions be purely in Tamil, or bilingual (Tamil paragraph + English paragraph)?

---

### 3. Learning Objectives Block

Add a `> **🎯 கற்றல் நோக்கங்கள்**` blockquote at chapter start with 3 objectives.

**Example for Chapter 5:**

```markdown
> **🎯 கற்றல் நோக்கங்கள்**
>
> - மாற்றுநர் (Transformer) கட்டமைப்பின் முக்கிய கலைச்சொற்களைப் புரிந்துகொள்ளுதல்
> - பெருமொழி மாதிரி (LLM), சிறுமொழி மாதிரி (SLM) ஆகியவற்றின் வேறுபாடுகளை அறிதல்
> - சொல்துண்டாக்கம் (Tokenization) மற்றும் முடிவுருவாக்கம் (Inference) பற்றிய புரிதல்
```

> **DECISION NEEDED:** Should learning objectives be in Tamil only, or bilingual with English translations in parentheses (as shown above)?

---

### 4. Sub-group Headings Within Chapters

Break the single large table into logical sub-groups with `###` headings. This makes chapters scannable and adds narrative structure.

**Example for Chapter 2 (Machine Learning):**

```
### கற்றல் முறைகள் — Learning Paradigms
(Supervised, Unsupervised, Semi-supervised, Self-supervised, RL, RLHF, RLAIF, Transfer, Federated, Multi-task, Contrastive, In-context)

### வகைப்பாடு & கொத்தாக்கம் — Classification & Clustering
(Classification, Clustering, Anomaly Detection)

### தரவு & மாதிரியாக்கம் — Data & Modeling
(Dataset, Data Points, Annotated Datasets, Annotation Schema, Data Augmentation, Synthetic Data, Data Modeling, Distribution Shift)

### மாதிரி நடத்தை — Model Behavior
(Overfitting, Bias-Variance Tradeoff, Validation Set, Ground Truth, Feature Extraction)
```

Each sub-group gets its own table. This transforms a wall of 30 rows into 4 digestible groups of ~7 rows each.

> **DECISION NEEDED:** Should each sub-group have its own table, or should we keep one table per chapter with `###` headings visually separating groups (using `---` horizontal rules)?

---

### 5. "அறிவீர்களா?" (Did You Know?) Callouts

Sprinkle 2-3 interesting callouts per chapter using `[!NOTE]` or `[!TIP]` admonitions. These break up the table monotony and add engaging context.

**Types of callouts:**

- **Etymology spotlight** — Highlight a particularly elegant Tamil coining
- **Tamil AI connection** — How a concept applies to Tamil NLP specifically
- **Historical context** — When/how a concept was invented
- **Comparison** — How Tamil word formation mirrors or differs from the English term

**Example:**

```markdown
> [!NOTE]
> **அறிவீர்களா?** "மதிமயக்கம்" (Hallucination) என்ற கலைச்சொல் மதி (intellect) + மயக்கம் (delusion) என்ற இணைப்பிலிருந்து உருவானது — AI தவறான தகவலை உண்மையெனக் கூறும் நிலையைத் துல்லியமாகப் பிரதிபலிக்கிறது.
```

```markdown
> [!TIP]
> **தமிழ் NLP குறிப்பு:** தமிழ் ஒட்டுநிலை மொழி (agglutinative) என்பதால், சொல்துண்டாக்கம் (Tokenization) ஆங்கிலத்தைவிடச் சவாலானது — ஒரு தமிழ்ச் சொல்லில் பல உருபுகள் ஒட்டிக்கொண்டிருக்கும்.
```

> **DECISION NEEDED:** How many callouts per chapter? 2-3 feels right, but more could be added for longer chapters. Should they be placed between sub-group tables or at the end?

---

### 6. Term Relationship Diagram (Concept Map)

Add a simple text-based relationship note or a Mermaid diagram showing how key terms in the chapter relate to each other. Since BookBuilder may not render Mermaid, this could be:
- A Gemini-generated concept map image, or
- A simple text-based hierarchy/list

**Example for Chapter 2:**

```
இயந்திரக் கற்றல் (ML)
├── மேற்பார்வையிட்ட கற்றல் → வகைப்பாடு
├── மேற்பார்வையற்ற கற்றல் → கொத்தாக்கம்
├── வலுவூட்டல் கற்றல் → RLHF → RLAIF
└── தன்மேற்பார்வைக் கற்றல் → BERT, GPT
```

> **DECISION NEEDED:** Should concept maps be Gemini-generated images or text-based tree diagrams? Images are more visually appealing but require more effort.

---

### 7. Knowledge Check (🧠 அறிவுச் சோதனை)

Add 5 questions at the end of each chapter. Question types:

- **பொருத்துக (Match):** Match English term → Tamil term (3-5 pairs)
- **கோடிட்ட இடத்தை நிரப்புக (Fill in the Blank):** Complete the Tamil term or definition
- **சரியா / தவறா (True / False):** Validate understanding of a concept
- **பல தேர்வு (MCQ):** Choose the correct Tamil term for an English concept

**Example:**

```markdown
## 🧠 அறிவுச் சோதனை — Knowledge Check

1. **பொருத்துக:** கீழ்க்கண்ட ஆங்கிலச் சொற்களுக்கு சரியான தமிழ்ச் சொல்லைப் பொருத்துக:

   | ஆங்கிலம் | தமிழ் |
   |:---------|:------|
   | Hallucination | அ) சாய்வு |
   | Bias | ஆ) மதிமயக்கம் |
   | Guardrails | இ) பாதுகாப்பு வேலிகள் |

2. **கோடிட்ட இடத்தை நிரப்புக:** "________ என்பது AI மாதிரியின் செயல்பாடுகள் மனித மதிப்புகளுக்கு உட்பட்டு இருப்பதை உறுதிசெய்யும் செயல்முறை." (Alignment)

3. **சரியா / தவறா:** "பெருமொழி மாதிரி (LLM) என்பது சிறுமொழி மாதிரியின் (SLM) மறுபெயர்."

<details>
<summary><strong>விடைகளைக் காண சொடுக்குக</strong></summary>

1. Hallucination → ஆ) மதிமயக்கம், Bias → அ) சாய்வு, Guardrails → இ) பாதுகாப்பு வேலிகள்
2. நெறிசீரமைப்பு (Alignment)
3. தவறு — LLM-ல் பில்லியன் கணக்கான அளபுருக்கள் இருக்கும், SLM-ல் குறைவானவை.

</details>
```

> **DECISION NEEDED:** Should knowledge checks be in Tamil only (immersive) or bilingual? Should all 10 chapters get them, or only the first few initially?

---

### 8. Chapter Summary (📋 அத்தியாயச் சுருக்கம்)

Add a summary at the end of each chapter with:
- Key terms count
- 3-4 key takeaways as a blockquote list
- "Common confusions" titled list

**Example:**

```markdown
## 📋 அத்தியாயச் சுருக்கம்

> **💡 முக்கிய கருத்துகள்**
>
> - இந்த அத்தியாயத்தில் 18 கலைச்சொற்கள் — AI வகைகள் முதல் அடிப்படைக் கருத்துகள் வரை
> - செய்யறிவு (AI) என்ற தமிழ்ச் சொல் "செய் + அறிவு" என்ற வேர்களில் இருந்து உருவானது
> - இயற்றறிவு (Generative AI), செயலூக்கச் செய்யறிவு (Agentic AI) ஆகியவை 2024-25-ன் முக்கிய AI போக்குகள்

**அடிக்கடி குழப்பமடையும் சொற்கள்:**
- செய்யறிவு (AI) vs இயற்றறிவு (Generative AI) — அனைத்து இயற்றறிவும் செய்யறிவு, ஆனால் அனைத்து செய்யறிவும் இயற்றறிவு அல்ல
- திறந்த மூலம் (Open Source) vs திறந்த எடை (Open Weight) — மூலக் குறிமுறை வெளியீடு vs எடைகள் மட்டும்
```

---

### 9. Cross-Reference Notes

Add `> [!TIP]` callouts that link related terms across chapters.

**Example in Chapter 3 (Neural Networks):**

```markdown
> [!TIP]
> **குறுக்கு இணைப்பு:** "வலுவூட்டல் கற்றல்" (Reinforcement Learning) பற்றி அத்தியாயம் 2-ல் காண்க. "மாற்றுநர்" (Transformer) கட்டமைப்பு அத்தியாயம் 5-ல் விரிவாக விளக்கப்பட்டுள்ளது.
```

---

### 10. Improved Front Matter

Enhance `00-front-matter.md` with:
- A book-level hero image
- A "How to use this book" section explaining the enhanced format
- A visual legend explaining admonitions, callouts, and quiz format
- Acknowledgments section for the சொல்லாய்வு community

> **DECISION NEEDED:** Should we add a "How to use this book" guide explaining the icons and format?

---

### 11. Appendix: Full Alphabetical Index

Add a new appendix with all 300+ terms sorted alphabetically by English term, with chapter references. This helps readers find a specific term quickly.

> **DECISION NEEDED:** Should the index be sorted by English or by Tamil? Or both (two separate indexes)?

---

## Implementation Priority

| Priority | Enhancement | Effort | Impact |
|:---------|:-----------|:-------|:-------|
| **P1** | Sub-group headings (4) | Low | High — immediately makes chapters scannable |
| **P1** | Chapter introductions (2) | Low | High — sets context for each domain |
| **P1** | Chapter summaries (8) | Medium | High — reinforces learning |
| **P2** | Hero images (1) | Medium | High — visual appeal, Gemini prompts ready |
| **P2** | Learning objectives (3) | Low | Medium — frames reader expectation |
| **P2** | "Did you know?" callouts (5) | Medium | High — most engaging addition |
| **P2** | Knowledge checks (7) | Medium | High — interactive, memorable |
| **P3** | Cross-references (9) | Low | Medium — connects the narrative |
| **P3** | Concept maps (6) | High | Medium — requires image generation |
| **P3** | Front matter improvements (10) | Low | Medium — first impression |
| **P4** | Alphabetical index (11) | Medium | Medium — reference utility |

---

## Finalized Decisions

| # | Question | Decision |
|:--|:---------|:---------|
| D1 | Hero image style | **Same palette (#1a4d2e green), unique compositions per chapter** |
| D2 | Introduction language | **Tamil text only, technical terms in Tamil first then English in brackets** |
| D3 | Learning objectives language | **Tamil with English terms in brackets (e.g., மாற்றுநர் (Transformer))** |
| D4 | Term entry format | **Bold heading (English — Tamil (Alt)) + explanation paragraph; no 4-column table** |
| D5 | Callout placement & count | **2-3 per chapter, placed between sub-group tables** |
| D6 | Concept map format | **Gemini-generated images + mermaid (.mmd → .svg) diagrams per sub-group** |
| D7 | Knowledge check language | **Tamil with English terms in brackets** |
| D8 | Knowledge check rollout | Pilot on Chapter 5 first, then roll out |
| D9 | Front matter "How to use" guide | **Added to 00-front-matter.md: icon legend, term format example, [^1] explanation** |
| D10 | Alphabetical index sorting | **English-sorted primary index (deferred to post-rollout)** |

**Language rule:** No English sentences. All content in Tamil. Key technical terms appear as தமிழ்ச்சொல் (English Term). Abbreviations (LLM, AI, etc.) in Tamil transliteration or as-is.

**Pilot chapter:** Chapter 5 (மாற்றுநர் & மொழிமாதிரிகள்) — v2 completed with:
- New term format: `**English — Tamil** (Alt)` heading + explanation paragraph (no 4-col table)
- 3 mermaid diagrams in `book/diagrams/`: transformer architecture, LLM types, Tamil tokenization
- Engaging story: "கவனம் மட்டுமே போதும்" — Attention Is All You Need origin story
- Callouts, summary, cross-references, knowledge check retained from v1
- Cluster intro paragraphs added per sub-group
- "💭 உங்கள் சிந்தனைக்கு" scenario-based thinking section (3 questions)
- Front matter updated with "How to use" guide and [^1] attribution note
- Natural prose formatting applied (em dashes removed from prose)

---

## Next Steps

1. **Resolve the open decisions above** (D1-D10)
2. Start with P1 items (sub-groups, introductions, summaries) — these require no images
3. Generate Gemini prompts for hero images (P2) in parallel
4. Add learning objectives and callouts (P2)
5. Add knowledge checks (P2)
6. Add cross-references and concept maps (P3)
7. Update `book-order.json` if new appendix files are added
8. Rebuild and review PDF output
