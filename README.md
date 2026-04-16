# Second Brain Template

A personal knowledge-base framework for Claude Code. You drop notes, journals, articles, and transcripts into `raw/`. Claude reads them, builds a cross-linked wiki of entities, themes, lessons, and decisions, and uses that wiki to answer questions about you — never guessing, always grounded in your own material.

## What you get

- **`knowledge-base/raw/`** — the source-of-truth folder. You add content here. A pre-tool-use hook blocks Claude from ever modifying it.
- **`knowledge-base/wiki/`** — Claude-maintained pages with `[[backlinks]]`, an index, and an append-only log. Governed by `SCHEMA.md`.
- **`CLAUDE.md`** — routes Claude to the right file for the right job: wiki for questions about you, teaching style for explanations, tone guide for content generation.
- **`.claude/hooks/protect-raw.sh`** — the single piece of automation. Blocks Edit/Write on `raw/`. Everything else is deliberately manual.
- **`skills/youtube-full`** — optional skill for ingesting YouTube transcripts.

## Install

Open a terminal in the directory where you want your knowledge base. Launch Claude Code. Paste this:

```
Clone https://github.com/AbdullahAbuHassann/second-brain-public into this project.
Follow the installer spec in AGENTS.md to set up CLAUDE.md, the knowledge-base
scaffold, the protect-raw hook, and the youtube-full skill. Confirm the hook
works by running the verification tests. After install, tell me what to
personalize first.
```

> Claude will read `AGENTS.md`, handle conflicts with any existing files, make the hooks executable, run verification, and print next steps.

## What's automated vs manual

| Action                          | Automated? | Why                                                                 |
| ------------------------------- | ---------- | ------------------------------------------------------------------- |
| Blocking writes to `raw/`       | Yes        | Defensive — protects source of truth, nobody wants this manual      |
| Ingesting `raw/` into `wiki/`   | No         | You choose what's worth ingesting and when                          |
| Updating `wiki/index.md`        | No         | Happens as part of ingestion, which is manual                       |
| Creating wiki pages             | No         | Driven by ingestion or explicit request                             |
| Wiki health-check / lint        | No         | Run when you feel the wiki's getting messy                          |
| GitHub sync                     | Opt-in     | Shipped as `sync.sh.example` — enable if you want cross-device sync |

## Personalize after install

Three files need your touch before this feels like your knowledge base:

1. **`knowledge-base/SCHEMA.md`** — fill in the *Context About Me* section.
2. **`knowledge-base/TEACHING-STYLE.md`** — keep the default or rewrite.
3. **`knowledge-base/TONE.md`** — rewrite with your own voice. The template shows the shape, not the content.

## Using it day-to-day

- **Drop a file:** put it in `knowledge-base/raw/` with a descriptive filename.
- **Ingest:** ask Claude *"Ingest `raw/filename.md`"*. It reads, updates the wiki, logs the action.
- **Ask questions:** ask anything about yourself — Claude reads `wiki/index.md` first, then follows backlinks.
- **Generate content:** ask for a draft — Claude matches `TONE.md`.
- **Lint:** ask *"Health-check the wiki"* to find contradictions, orphans, missing pages.

## Credits

Inspired by the "paste a prompt, Claude installs it" pattern popularized by projects like [coleam00/claude-memory-compiler](https://github.com/coleam00/claude-memory-compiler).
