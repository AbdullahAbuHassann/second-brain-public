# Second Brain

Your personal knowledge base, powered by Claude. Drop in your journals, notes, articles, and transcripts — Claude reads them, organizes them into a wiki, and uses that wiki to answer questions about you.

## Setup (takes 2 minutes)

1. Open a terminal in any empty folder where you want your knowledge base to live.
2. Start Claude Code (`claude` in the terminal).
3. Paste this prompt:

```
Clone https://github.com/AbdullahAbuHassann/second-brain-public into this project.
Follow the installer spec in AGENTS.md to set it up. After install, tell me
what to personalize first.
```

4. Follow Claude's instructions to fill in three files with your personal info. That's it.

## How to use it

- **Add a note:** drop any file (journal, goals, article, transcript) into `knowledge-base/raw/`.
- **Tell Claude:** *"Ingest `raw/filename.md`"* — Claude reads it and updates your wiki.
- **Ask anything about yourself:** *"What are my goals for this year?"*, *"What have I learned about discipline?"*, *"Summarize my thinking on X."* — Claude answers from your wiki.
- **Ask for content in your voice:** *"Draft a tweet about Y"*, *"Write a short essay on Z"* — Claude matches the tone you set up.

## What makes this different

Claude never guesses about you. Every answer is grounded in notes you wrote. The more you add to `raw/`, the smarter it gets about you.
