# Changelog

All notable changes to the Tamil AI Glossary project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> **Note:** This project was extracted from [tamil-prompt-standard](https://github.com/example/tamil-prompt-standard). Entries below are migrated from that project's CHANGELOG, filtered to glossary-related changes only. Original path `docs/glossary/AI-tamil-glossary.md` is now `ai-tamil-glossary.md`.

## [Unreleased]

### Added

- **Footnote convention** (`ai-tamil-glossary.md`): replaced all inline "(சொல்லாய்வு குழுவின் கலைச்சொல்.)" mentions with footnote `[^1]`; added footnote definition at the bottom linking to the முகநூல் சொல்லாய்வு குழு and source document
- **Deviation document** (`docs-glossary/deviations-from-sollaayvu.md`): created document listing 19 terms in `ai-tamil-glossary.md` that deviate from the சொல்லாய்வு குழு original, categorized by type (ஒற்றுச் சேர்ப்பு, இணைக்குறி நீக்கம், சந்தி இலக்கணம், சொல் மாற்றம், முன்னுரிமை மாற்றம், பகுதி நீக்கம்) with reasons
- **Project configuration** (`CLAUDE.md`): created project rules file with goals, required skills (tamil-article-review, natural-prose-formatting), reference materials, file structure, and conventions

---

## Pre-migration History (from tamil-prompt-standard)

> The following entries document the glossary's evolution while it lived under `docs/glossary/AI-tamil-glossary.md` in the tamil-prompt-standard project.

### Added

- **AI glossary terms** (`AI-tamil-glossary.md`): added 9 modern AI terms — Autonomous Agents, Context Window, Embeddings, Few-shot prompting, Fine-tuning, Model Weights, Reinforcement Learning, Retrieval-Augmented Generation (RAG), Zero-shot prompting
- **AI glossary — book terms** (`AI-tamil-glossary.md`): added Agent (மாற்றும் முகவர்), Transformer (மாற்றுநர்), Chain of Thought (படிநிலைச் சிந்தனை), Deep Learning (ஆழ்திறன் கற்றல்), Prompt (கட்டளை / தூண்டுவினா), Critical Thinking Question (திறன்நோக்குவினா), Iterative Refinement, Learning Objective, Algorithm, Debugging, Code, Documentation, Programming Language, Social Media, Testing; added third column **எப்படி வந்தது? / விளக்கம்** with etymology/definitions
- **AI glossary — modern AI concepts** (`AI-tamil-glossary.md`): added Attention (கவனம்), Self-Attention (தன்-கவனம்), Temperature (கற்பனை அளவு / சீரின்மை அளவு / புதுமைத்திறன் அளவு / பல்வகைமை அளவு), Multimodal (பன்முகமாதிரி), Foundation Model (அடிப்படை மாதிரி), Knowledge Cutoff (அறிவு வரம்பு), Prompt Injection (தூண்டுவினா ஊடுருவல்), System Prompt (அமைப்புத் தூண்டல்), User Prompt (பயனர் தூண்டல்) — each with Tamil description in column 3
- **AI glossary — Agent terminology refinement** (`ai-tamil-glossary.md`): linguistic correction — replaced "முகவர்" (human-agent suffix; means representative) with "செயற்பாட்டாலி" (non-human/machine agent; -ஆலி suffix as in செயலி, கணினி) across all AI-agent entries since AI agents are software, not human representatives. Updated Agent (செயற்பாட்டாலி primary), Agent Orchestration (செயற்பாட்டாலி ஒருங்கிணைப்பு), AI Agents → "AI Agent / AI Agents" (செய்யறிவுச் செயற்பாட்டாலி(கள்)), Autonomous Agents (தன்னாட்சிச் செயற்பாட்டாலிகள்), and Reinforcement Learning description for consistency. Kept old "முகவர்" forms as alternatives for backward recognition.
- **AI glossary — advanced reasoning, optimization, and DeepSeek-era terms** (`ai-tamil-glossary.md`): added 23 new AI terms — Abstraction (புறவயமாக்கம்), DeepFake (ஆழ்பொய்), DeepSeek/company (ஆழ்தேடி), DeepThink (ஆழ்சிந்தனை), Distillation (சுரக்காய்வு), Emergence (தோன்றுமியல்பு), Explainability (விளக்கத்தகவு), GraphRAG (வரைபட RAG), Hallucination Rate (மதிமயக்க வீதம்), Inference Scaling (முடிவுருவாக்க நீட்சி), Jailbreak (விதிவிலக்கு ஊடுருவல்), Mixture of Depths/MoD (ஆழக் கலவை), MoE Routing (வல்லுநர் வழிப்படுத்தல்), Prompt Chaining (தூண்டல் சங்கிலி), Pruning (வெட்டித்திருத்தம்), Reasoning Chain (ஏரணச் சங்கிலி), RL from AI Feedback/RLAIF (AI பின்னூட்ட வலுவூட்டல் கற்றல்), Robustness (வலுவுறுதி), Scalar (தன்மதிப்பு), Self-Consistency (தன்முறை ஒருமை), Tensor (பன்மதிப்புக் கணம்), Test-Time Compute (சோதனைநேரக் கணிப்பு), Tree of Thoughts/ToT (சிந்தனை மரம்); updated Fairness primary to நேர்மை (was நீதிமை which means justice), updated Quantization primary to கணிய அளவாக்கம் (more precise); skipped Context Length (already an alternative in Context Window entry). Glossary now ~247 entries.
- **AI glossary — recommendation-doc additions** (`ai-tamil-glossary.md`): added 28 modern AI/LLM ecosystem terms with Tamil explanations — Agent Orchestration, AI Copilot, AI Sandbox, Autonomous Workflow, Beam Width, Dense Model, Deterministic Output, Diffusion Model, Federated Learning, Image Generation, Knowledge Base, Knowledge Graph, KV Cache, MCP (Model Context Protocol), Neural Search, OCR (Optical Character Recognition), On-device AI, Reasoning Model, Sampling Strategy, Semantic Kernel, Speculative Decoding, Speech Recognition, Speech-to-Text (STT), Stable Diffusion, Text-to-Speech (TTS), Token Limit, Toolformer, Vector Embeddings. Skipped 4 duplicates already in glossary (Edge AI, MoE, Sparse Model, Synthetic Data). Glossary now ~224 entries.
- **AI glossary Version 2** (`ai-tamil-glossary-ver2.md`): created standardized v2 from author's cleaned-up CSV — 195 entries with consistent sandhi (புணர்ச்சி) rules, split merged concepts (Agentic AI / AI Agents separated), all entries have definitions, Tamil-first notes, standardized `Full Name (ACRONYM)` format. 4-column structure: English | Primary Tamil Word | Alternative Tamil Words | Notes. Added Probabilistic Reasoning (நிகழ்தகவு ஏரணம்) as separate entry, restoring the pair with Deterministic Reasoning that was lost in the v→v2 transition. Also synced Probabilistic Reasoning into the v1 glossary.
- **AI glossary — inference & long context** (`AI-tamil-glossary.md`): added 2 terms — Inference (அனுமானம் / முடிவுருவாக்கம்), Long Context (நீண்ட சூழல்) — both with Tamil explanations
- **AI glossary — core ML vocabulary** (`AI-tamil-glossary.md`): added 40 core ML/AI terms with Tamil explanations — Activation Function, Adapter, API, Autoencoder, Autoregressive Model, Batch Size, Beam Search, Classification, Clustering, Cross-Entropy, Decoder, Dense Layer, Distribution Shift, Dropout, Encoder, Fairness, Feature Extraction, Fine-Grained, Gradient, Grounding, Hyperparameter, Instruction Tuning, Interpretability, Latency, Layer, Learning Rate, LoRA, Machine Translation, Model Compression, Overparameterization, Parameter, Precision, Pretraining, Recall, Sequence-to-Sequence, Softmax, Sparse Model, Validation Set, Weight Decay, Zero-shot Learning
- **AI glossary — vibe coding & schema** (`AI-tamil-glossary.md`): added 3 new AI terms with Tamil explanations — Vibe Coding (உள்ளுணர்வு நிரலாக்கம் / உரைவழி நிரலாக்கம்), Vibe Deploying (உடனடி மென்பொருள் வெளியீடு), Logical Schema (ஏரண வரைவு / ஏரண மாதிரி)
- **AI glossary — ML fundamentals, safety, and modern AI** (`AI-tamil-glossary.md`): added 21 new AI terms with Tamil explanations — Agentic AI / AI Agents (செயலூக்க செய்யறிவு), AI Safety (செய்யறிவுப் பாதுகாப்பு), Benchmark (அளவுகோல்), Constitutional AI (அரசியல் சட்ட செய்யறிவு), Contextual Embedding (சூழல் பொதிவு), Data Augmentation (தரவு விரிவாக்கம்), Edge AI (ஓரத்து செய்யறிவு), Emergent Abilities (தோன்றும் திறன்கள்), Epoch (சுழற்சி / யுகம்), Ethics in AI (செய்யறிவு நெறிமுறை), Evaluation (மதிப்பீடு), Gradient Descent (சரிவு இறக்கம்), Hallucination Mitigation (மதிமயக்கத் தடுப்பு), Leaderboard (முன்னிலைப் பட்டியல்), Loss Function (இழப்புச் சார்பு), Machine Learning (இயந்திரக் கற்றல்), Parameter-Efficient Fine-Tuning/PEFT (எடை-சிக்கன நுண்திருத்தம்), Red Teaming (சிவப்பு அணி சோதனை), Supervised Learning (மேற்பார்வையிட்ட கற்றல்), Transfer Learning (பரவல் கற்றல்), Unsupervised Learning (மேற்பார்வையற்ற கற்றல்); updated 6 existing entries — Agent, Alignment, Cloud Computing, MoE, RLHF, Synthetic Data
- **AI glossary — reasoning & ontology terms** (`AI-tamil-glossary.md`): added 7 reasoning/prompting terms with Tamil explanations — Abductive Reasoning (ஊக ஏரணம்), Deductive Reasoning (பகுப்பு ஏரணம்), Deterministic vs. Probabilistic Reasoning (திட்டவட்ட ஏரணம் / நிகழ்தகவு ஏரணம்), Emotional Prompting (உணர்வுத் தூண்டுதல்), Inductive Reasoning (தொகுப்பு ஏரணம்), Logical Reasoning (ஏரணப் பகுத்தறிதல்), Ontology (பொருள் உறவுமுறை அமைப்பு)
- **AI glossary — NLP & RAG terms** (`AI-tamil-glossary.md`): added 7 new NLP/retrieval terms with Tamil explanations — Chunking (உரைத்துண்டாக்கம்), Coreference Resolution (பரிமாற்றுச் சுட்டுத்தீர்வு / சுட்டுப்பெயர் இணைப்பு), Part-of-Speech (POS) Tagging (இலக்கணக் குறியிடுதல்), Relation Extraction (தொடர்பு பிரித்தெடுத்தல்), Semantic Textual Similarity (பொருள்சார் உரை ஒப்புமை), Synthetic Data (செயற்கைத் தரவு / புனைவுத் தரவு), Vector Search (திசையன் தேடல் / பொருள்சார் தேடல்); expanded Fine-tuning and RAG entries; removed redundant NLP Tasks entry
- **AI glossary — affective AI & emotion terms** (`AI-tamil-glossary.md`): added 15 AI terms sourced from author's Tholkappiyam research article — Affective AI (உணர்வுசார் செய்யறிவு), Affective Computing (உணர்வுசார் கணினியியல்), Anomaly Detection (இயல்பு விலகல் கண்டறிதல்), Annotation Schema (தரவு குறியீட்டு வரைவு), Bias (சாய்வு / பாரபட்சம்), Culturally-aware AI (பண்பாட்டுச் சார்பு செய்யறிவு), Data Modeling (தரவு மாதிரியாக்கம்), Data Points (தரவுப்புள்ளிகள்), Emotion Classification (உணர்வு வகைப்பாடு), Emotion Detection (உணர்வுக் கண்டறிதல்), Explainable AI/XAI (விளக்கமளிக்கத் தக்க செய்யறிவு), Facial Action Coding System/FACS (முகச்செயல் குறியீட்டு முறைமை), Facial Expression Recognition (முகபாவ அங்கீகாரம்), Finite State Machine/FSM (நிலை இயந்திரம்), Sentiment Analysis (உணர்வுப் பகுப்பாய்வு)
- **AI glossary — training & sampling terms** (`AI-tamil-glossary.md`): added 17 more AI terms with Tamil explanations — Alignment (நெறிமுறைச் சீரமைப்பு), Artificial General Intelligence/AGI (செய்சாலறிவு), Artificial Super Intelligence/ASI (செய்வியனறிவு), Blockchain (கட்டச்சங்கிலி), Direct Preference Optimization/DPO (நேரடி விருப்ப உகப்பாக்கம்), Guardrails (பாதுகாப்பு வேலிகள்), Internet of Things/IoT (பொருள்களின் பிணையம்), Meta Prompt (முதன்மைக் கட்டளை), Overfitting (மிகைப்பொருத்தம்), Perplexity (திகைப்பளவு), Quantization (அளவாக்கம்), Reinforcement Learning from Human Feedback/RLHF (மனிதக் கருத்துப்பொதிந்த வலுவூட்டல் கற்றல்), Reward Model (வெகுமதி மாதிரி), Top-K Sampling (உயர்-K மாதிரி எடுத்தல்), Top-P/Nucleus Sampling (அணுகுத் தொகுதி மாதிரி எடுத்தல்), Vector Database (திசையன் தரவுத்தளம்); expanded Context Window entry with additional Tamil alternatives

### Changed

- **AI glossary capitalization** (`AI-tamil-glossary.md`): capitalized first letter of all English terms for consistency (e.g., `token` → `Token`, `prompt engineering` → `Prompt Engineering`, `synchronous` → `Synchronous`)

### Removed

- **AI glossary — non-AI personal-development terms** (`AI-tamil-glossary.md`): removed 27 Self-* terms (Self-development, Self-respect, Self-esteem, etc.) — these are personal-development vocabulary, not AI terms. Kept only Self-Attention (an AI architecture term).

---

## Guidelines for Future Changes

### When to Update CHANGELOG

- **Added**: New glossary terms, reference documents, or project documentation
- **Changed**: Modifications to existing terms, formatting, or conventions
- **Fixed**: Corrections to Tamil terminology, sandhi, or definitions
- **Removed**: Removal of terms or documents

### Version Numbering

- **MAJOR** (X.0.0): Breaking changes to glossary structure or format
- **MINOR** (0.X.0): New terms or non-breaking additions
- **PATCH** (0.0.X): Fixes to existing entries and documentation updates
