---
name: prompt-generator
description: Create structured, verifiable, low-hallucination prompts from rough ideas, task descriptions, or existing drafts. Use when the user asks to write, refine, optimize, audit, or templatize a prompt; build a prompt generator; define an agent/system role; reduce hallucinations; or turn ambiguous requirements into a clear prompt, including requests such as "help me write a prompt", "optimize this prompt", "make a prompt generator", or "帮我写/优化提示词".
---

# Prompt Generator

## Overview

Turn incomplete user intent into a clean prompt that is easy for another model or agent to follow. Keep interactions minimal, ask only the smallest set of clarifying questions needed to avoid avoidable errors, and default to explicit uncertainty handling instead of guessing.

## Workflow

### 1. Capture the real objective

Identify the user's actual goal before drafting anything:
- What system, assistant, or role they want to create
- What outcome or deliverable they expect
- What inputs, data sources, or references are available
- How cautious the prompt should be about factual accuracy

If the user has not given a topic yet, begin with exactly this message:

> What is the topic or role of the prompt you want to create? Share any details you have, and I will help refine it into a clear, verified prompt with minimal chance of hallucination.

### 2. Ask only critical clarifying questions

Ask follow-up questions only when missing details would materially change the result or create hallucination risk. Prefer one concise batch of questions. Good clarifications usually target:
- Intended audience or user of the final prompt
- Expected output format
- Required data sources, references, or examples
- Whether the prompt should instruct the model to browse, cite, verify, or disclaim uncertainty

If a reasonable assumption is safe, make it and state it briefly in the final delivery instead of interrupting the user.

### 3. Decompose complex requests

When the task is multi-part, high-stakes, or technically deep, break it into smaller subtasks before drafting the final prompt. Typical subtask splits:
- Task understanding and scope definition
- Domain-specific solution work
- Independent verification or critique
- Final synthesis into one polished prompt

### 4. Assign expert personas only when helpful

Use lightweight internal expert personas to improve reliability, but only when they add value. Examples:
- `Expert Researcher` for source-aware factual work
- `Expert Writer` for tone, style, and structure
- `Expert Mathematician` for proofs, derivations, or quantitative reasoning
- `Expert Python` for code, calculations, or sandbox-friendly scripts
- `Expert Reviewer` or another fresh specialist for independent validation

Never reuse the same expert persona for both initial creation and final validation when "fresh eyes" are requested or warranted.

When briefing an expert persona, give complete instructions because that persona has no memory of prior steps.

### 5. Minimize hallucination by design

Bake these behaviors into the final prompt whenever accuracy matters:
- Instruct the system not to guess missing facts
- Tell it to state uncertainty plainly when evidence is missing
- Tell it to ask for sources or inputs when necessary
- Tell it to distinguish verified facts from assumptions or estimates
- Tell it to verify important claims against provided references, tools, or data before answering
- If no source access exists, require a disclaimer instead of fabricated certainty

For coding or quantitative tasks, prefer adding an `Expert Python` or equivalent verification step. For high-stakes advice, instruct the system to cite or explicitly warn about limits.

### 6. Build the final prompt with this structure

Use this exact section order unless the user asks for a different format:

```md
[Short and direct role definition, emphasizing verification and disclaimers for uncertainty.]

Context
[User's task, goals, or background. Summarize clarifications gleaned from user input.]

Instructions
[Stepwise approach or instructions, including how to query or verify data. Break into smaller tasks if necessary.]
[If code or math is required, instruct "Expert Python" or "Expert Mathematician." If writing or design is required, use "Expert Writer," etc.]
[Explain how to handle missing information, uncertainty, and verification.]

Constraints
[List style, length, safety, source, or compliance limits.]

Output Format
[Specify the exact response shape: bullets, sections, tables, JSON, code blocks, or prose.]

Reasoning
[Include only if the user explicitly wants rationale or chain-of-thought. Otherwise omit.]

Examples
[Include only user-provided examples or examples that materially improve accuracy.]
```

## Output Rules

- Deliver the final prompt directly once you have enough information.
- Keep any preface short. Do not bury the prompt in long commentary.
- If you made assumptions, add a brief `Assumptions` note after the prompt instead of expanding the prompt body unnecessarily.
- If you used expert personas for internal checking, mention that the prompt was cross-checked, but do not invent evidence of real-world verification.
- Prefer concise, implementation-ready language over motivational or theatrical wording.

## Quality Bar

Before sending the final prompt, verify that it:
- Has a clear role/persona
- States the user's task and context accurately
- Defines how to handle uncertainty or missing facts
- Specifies output structure
- Includes expert delegation only where it genuinely helps
- Avoids unsupported claims about data access, tool access, or certainty
