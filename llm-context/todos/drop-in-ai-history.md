# Drop in AI History — Image Prompts

## Master Prompt

Use this as the base for every "A Drop in AI History" image. Append the chapter-specific section below it to generate the final image.

> **Master Prompt:**
> Create a high-quality, detailed pixel-art illustration. The style should be modern 16-bit or 32-bit pixel art, with a retro-futuristic aesthetic, vibrant and cohesive colors, and atmospheric lighting. The composition should be clean, centered, and highly symbolic, suitable for a premium tech book illustration.
> 
> **CRITICAL CONSTRAINTS:**
> - Absolutely NO text, NO words, NO letters, and NO numbers anywhere in the image.
> - The art must be purely visual storytelling.
> - Background should be clean and not overly cluttered to ensure the main subject stands out.
> - 1:1 square aspect ratio (image is displayed at 250px width, right-aligned in the book).

---

## Chapter-Specific Prompts

### Chapter 01 (AI Foundations)
**Topic:** Dartmouth Workshop 1956
> **Prompt:** Pixel art of a classic 1950s ivy-league university building interior. A group of vintage scientists in suits are gathered around a glowing, futuristic mechanical brain on a table. Contrast between 1950s retro aesthetics and glowing neon sci-fi technology.

### Chapter 02 (Machine Learning)
**Topic:** Deep Blue vs Kasparov
> **Prompt:** Isometric pixel art of a classic chess board. On one side, an imposing, high-tech metallic robotic hand is moving a glowing chess piece. On the other side, a human hand is waiting. Dramatic lighting, casting deep shadows over the board.

### Chapter 03 (Neural Networks)
**Topic:** AI Winter & Godfathers
> **Prompt:** Pixel art of a snowy, frozen winter landscape (symbolizing the 'AI Winter'). In the center, three lone scientists are huddled around a glowing, fiery neural network structure that is melting the snow around it, bringing warmth and light to the cold scene.

### Chapter 04 (Training & Optimization)
**Topic:** Cost of Training / Energy Consumption
> **Prompt:** Pixel art of a towering, monolithic stack of modern GPU server racks. The servers are glowing intensely with neon heat and electricity, emitting visual energy waves. It looks like a high-tech, futuristic power plant.

### Chapter 05 (Transformers & Language Models)
**Topic:** Attention Is All You Need Paper
> **Prompt:** Pixel art of a glowing, golden magnifying glass focusing intensely on a single, glowing abstract node within a sea of data particles. The focused node radiates golden light, symbolizing the concept of "Attention" in a vast network.

### Chapter 06 (NLP & Text Processing)
**Topic:** ELIZA Chatbot Therapist
> **Prompt:** Pixel art of a retro 1960s CRT monitor glowing green on a wooden desk. Next to the desk is a classic leather therapist's couch. The scene blends vintage computing with psychological therapy aesthetics.

### Chapter 07 (Embeddings & Search)
**Topic:** Word2Vec Math (King - Man + Woman = Queen)
> **Prompt:** Pixel art showing floating magical or mathematical symbols in space. A glowing golden king's crown, a glowing minus sign, a glowing plus sign, and a beautiful glowing queen's crown. The elements are connected by glowing energy lines.

### Chapter 08 (Prompting & Interaction)
**Topic:** Chevy Tahoe sold for $1 (Prompt Injection)
> **Prompt:** Pixel art of a shiny, modern SUV car parked in a futuristic showroom. Next to the car is a robotic salesman glitching out, happily handing over the car keys to a sneaky hacker character in a hoodie. A giant, single golden coin rests on the car's hood.

### Chapter 09 (AI Agents & Tools)
**Topic:** AlphaStar beats humans at StarCraft II
> **Prompt:** Pixel art of a glowing, futuristic robotic hand hovering over a complex, sci-fi real-time strategy game terrain. The terrain features glowing alien bases, futuristic units, and laser beams. The robot hand is controlling the units like a master tactician.

### Chapter 10 (Safety, Ethics & Evaluation)
**Topic:** Elon Musk sues OpenAI
> **Prompt:** Pixel art of a heavy, wooden judge's gavel striking a glowing, high-tech computer motherboard. Sparks of digital energy fly out from the impact. A strong visual metaphor for the collision of law, ethics, and advanced technology.

### Chapter 11 — பிற்சேர்க்கை (Appendix: Computing Infrastructure)
**Topic:** The scramble for NVIDIA H100 chips
> **Prompt:** Pixel art of an ultra-secure, futuristic bank vault. Inside the glowing vault, resting on a pedestal like a priceless diamond, is a single, glowing high-tech GPU microchip radiating immense golden power.

---

## Usage Instructions

1. Copy the **Master Prompt** block.
2. Append the desired **Chapter-Specific Prompt** block.
3. Feed to an image generation model (Gemini, Midjourney, DALL-E 3, etc.).
4. Review: verify **zero text** appears in the output — regenerate if any text leaks through.
5. Save as `book/images/drop-in-history-ch{NN}.png` (e.g., `drop-in-history-ch01.png`, `drop-in-history-ch11.png`).
6. Update each chapter's `<img src=` tag to reference the new file name and update the `alt` text accordingly.
