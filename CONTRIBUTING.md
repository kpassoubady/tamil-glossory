# Contributing to Tamil AI Glossary

We welcome contributions from the community! Whether you are a linguist, AI practitioner, developer, or Tamil enthusiast, your help is valuable.

## How to Contribute

### 1. Adding New Terms

1. **Check existing entries:** Search `ai-tamil-glossary.md` to avoid duplicates.
2. **Follow the format:** Use the 4-column table format:

   ```
   | English Term | Primary Tamil Word | Alternative Tamil Words | Notes / Explanation |
   ```

3. **Follow naming conventions:**
   - Prioritize சொல்லாய்வு குழு terms where available (mark with `[^1]`)
   - Use compound words (ஒற்றுச் சேர்ப்பு) for 2-word Tamil terms
   - Include `a + b + c` word-root explanations where possible
   - Avoid வடசொற்கள் when Tamil alternatives exist
   - Use singular form for terms
4. **Alphabetical order:** Insert terms in English alphabetical order.

### 2. Improving Existing Terms

- Fix Tamil grammar, sandhi (புணர்ச்சி), or spelling errors
- Improve definitions for clarity
- Add missing alternative Tamil words
- Add or correct word-root explanations

### 3. Reporting Issues

- Use the "Issues" tab to report incorrect terms, missing entries, or formatting problems

---

## Pull Request Process

1. Fork the repository.
2. Create a new branch (`git checkout -b glossary/add-new-terms`).
3. Make your changes following the conventions above.
4. Commit your changes (`git commit -m "feat: add 5 new ML terms"`).
5. Push to the branch (`git push origin glossary/add-new-terms`).
6. Open a Pull Request.

### PR Checklist

- [ ] Terms follow the 4-column table format?
- [ ] Tamil content is grammatically correct with proper sandhi?
- [ ] வடசொற்கள் avoided where Tamil alternatives exist?
- [ ] Entries are in alphabetical order (by English term)?
- [ ] சொல்லாய்வு குழு terms marked with `[^1]` where applicable?
- [ ] No duplicate entries?
- [ ] CHANGELOG.md updated?

---

## Term Review Criteria

Every glossary PR is reviewed for:

1. **Linguistic accuracy** — correct Tamil grammar, sandhi, and spelling
2. **Term quality** — clear, concise, and usable Tamil terminology
3. **Consistency** — follows project conventions (compound words, singular form, etc.)
4. **Cultural appropriateness** — respectful of Tamil language heritage
5. **Source attribution** — சொல்லாய்வு குழு terms properly marked

---

## Commit Message Format

This project uses [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` — new terms or documents
- `fix:` — corrections to existing terms
- `docs:` — documentation updates (README, CONTRIBUTING, etc.)
- `refactor:` — restructuring without changing content

---

## License

By contributing, you agree that your contributions will be licensed under the [Creative Commons Attribution 4.0 International License](LICENSE).
