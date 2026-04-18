# Second Brain

Your personal knowledge base, powered by Claude and Obsidian. Drop your journals, notes, goals, and exports into one folder. Claude reads everything and builds a cross-linked wiki that answers questions about you and spots patterns across your whole life.

## Setup

1. **Download Obsidian** from [obsidian.md](https://obsidian.md). Obsidian is a free app for viewing and browsing your notes — this is where you'll see your knowledge base come to life.

2. **Download the Claude desktop app** from [claude.ai/download](https://claude.ai/download). Sign in.

3. **Open Obsidian → create a new vault.** Name it whatever you want (`my-brain`, `second-brain`, anything). This just creates a folder on your computer. Remember where you saved it.

4. **Open the Claude desktop app → click "Code" in the sidebar → pick that same Obsidian vault folder** when Claude asks which folder to work in.

5. **Paste this into Claude** and press send:

```
Clone https://github.com/AbdullahAbuHassann/second-brain-public into this project.
Follow the installer spec in AGENTS.md to set it up. After install, tell me
what to personalize first.
```

Claude will download everything and tell you which files to fill in with your info.

6. **Drop all your content into the `raw/` folder.** Open Obsidian — you'll see a folder called `knowledge-base/raw/`. Drag any document you want into it: journals, goals, Apple Notes exports, articles, transcripts. Anything. The more you drop in, the smarter your brain gets. (Example: I exported all my Apple Notes, dropped them in, then added my goals and a list of things I want to improve.)

7. **Tell Claude to build your wiki.** Paste this into Claude:

```
Process my raw folder one file at a time, following knowledge-base/SCHEMA.md.
For each file: read it fully, build the wiki (entities, themes, lessons,
decisions, with [[backlinks]]), update wiki/index.md, append to wiki/log.md,
then tell me what you did and wait for me to say "continue" before moving
to the next file.
```

Claude will ingest the first file and show you the pages it created. Say *"continue"* (or *"next"*) to move to the next file. One at a time is deliberate — batch-ingesting a whole folder at once makes Claude skim and miss cross-file patterns. Open Obsidian between steps to watch the wiki grow and click any `[[link]]` to jump between pages.

## What you'll see inside your vault

- **`raw/`** — where you drop your stuff. Claude never edits these; they're your source of truth.
- **`wiki/`** — Claude builds this by reading everything in `raw/`. Pages for your goals, lessons, decisions, themes — all linked together.
- **`SCHEMA.md`** — the rulebook Claude follows when building the wiki.
- **`TEACHING-STYLE.md`** — how Claude explains things to you.
- **`TONE.md`** — how Claude writes content in your voice.

## How to use it day-to-day

- **Ask anything about yourself:** *"What are my goals for this year?"*, *"What have I learned about discipline?"*, *"What are my blind spots?"*
- **Get a second opinion grounded in you:** *"I'm thinking about doing X — what do you think based on my patterns?"* Claude reads your wiki before answering, so the advice is shaped by who you actually are.
- **Save any link or note.** Paste a tweet, YouTube URL, article, TikTok, or just raw text into Claude and say *"save this"*. The knowledge base skill fetches it, explains it in your style, and files it in your wiki — all automatically.
- **Keep adding to `raw/`.** Anytime you export a new batch of notes or drop in a new document, tell Claude *"process the new stuff in raw"* and it'll update the wiki.
- **Health check:** *"Lint the wiki"* or *"health check the wiki"* — Claude finds contradictions, missing pages, and gaps.

## Optional: set up Apify (for X, TikTok, Instagram)

**Skip this if you don't care about saving content from those three sites.** Regular articles, YouTube, and your own notes work without Apify.

1. Go to [apify.com](https://apify.com) and make a free account.
2. In the Claude desktop app: profile → **Settings** → **Connectors** → **Browse** → search for **Apify** and connect.
3. Done. Next time you send a tweet or TikTok to Claude, it'll use Apify automatically.

## What makes this different

Claude never guesses about you. Every answer is grounded in content you actually saved. The more you add, the smarter it gets — and the more it starts surfacing patterns, contradictions, and connections you'd never spot yourself.
