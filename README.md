# Second Brain

Your personal knowledge base, powered by Claude. Drop in your journals, notes, articles, and transcripts — Claude reads them, organizes them into a wiki, and uses that wiki to answer questions about you.

## Setup

1. **Create a new folder** somewhere easy to find (like your Desktop). Name it whatever you want — `my-brain`, `second-brain`, anything.
2. **Download the Claude desktop app** from [claude.ai/download](https://claude.ai/download). Install and sign in.
3. **Open the Claude app** and click **Code** in the sidebar.
4. **Pick the folder you just created** when Claude asks which folder to work in.
5. **Paste this message** into the chat and press send:

```
Clone https://github.com/AbdullahAbuHassann/second-brain-public into this project.
Follow the installer spec in AGENTS.md to set it up. After install, tell me
what to personalize first.
```

6. Claude will set everything up and tell you what to personalize. Follow its instructions.

> **What you'll see appear inside your folder:**
> - `knowledge-base/` — the main folder for your brain. Inside it:
>   - `raw/` — **this is where you drop your notes, journals, articles.**
>   - `wiki/` — Claude's organized version of your notes (leave it alone, Claude manages it).
>   - `briefings/`, `content/`, `platforms/` — optional, for drafts and outputs.
> - `skills/` — extra tools, like one for pulling YouTube transcripts.
> - `CLAUDE.md` — instructions that tell Claude how to work with your brain.
> - `.claude/` — behind-the-scenes settings (hidden by default; ignore it).

## How to use it

- **Add a note:** drag any file (journal, goals doc, article, transcript) into the `knowledge-base/raw/` folder.
- **Tell Claude about it in plain English:** *"Save this to my knowledge base"*, *"Add my new journal to the brain"*, *"I just dropped a new file in raw — process it."* Claude reads the file and updates your wiki.
- **Ask anything about yourself:** *"What are my goals for this year?"*, *"What have I learned about discipline?"*, *"Summarize my thinking on X."*
- **Ask for writing in your voice:** *"Draft a tweet about Y"*, *"Write a short essay on Z."*

## What makes this different

Claude never guesses about you. Every answer is grounded in notes you actually wrote. The more you add, the smarter it gets about you.
