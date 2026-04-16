# Second Brain

Your personal knowledge base, powered by Claude. Send Claude a link (article, tweet, YouTube video, TikTok) or paste some notes. Claude saves it, explains it in your learning style, and organizes everything into a wiki it can use to answer questions about you later.

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
>   - `raw/` — **where your saved notes land** (you won't usually put files here manually; Claude does it when you send a link).
>   - `wiki/` — Claude's organized version of your notes (leave it alone, Claude manages it).
>   - `briefings/`, `content/`, `platforms/` — optional, for drafts and outputs.
> - `skills/` — the two skills that power everything (see below).
> - `CLAUDE.md` — instructions that tell Claude how to work with your brain.
> - `.claude/` — behind-the-scenes settings (hidden by default; ignore it).

## Optional: set up Apify (for X, TikTok, Instagram)

**Skip this if you only save articles, YouTube, or your own notes.** You need Apify only if you want to save content from X/Twitter, TikTok, or Instagram — those sites block normal fetching.

1. Go to [apify.com](https://apify.com) and make a free account.
2. In the Claude desktop app, click your profile → **Settings** → **Connectors** → **Browse** → search for **Apify** and connect it. Claude will guide you through the token step.
3. That's it. Next time you send Claude a tweet or TikTok, it'll use Apify automatically.

## How to use it

- **Send Claude a link.** Paste any URL — an article, tweet, YouTube video, TikTok — and say *"save this"* (or just paste the link on its own). Claude fetches the content, saves it, explains it in your teaching style, and files it in your wiki.
- **Paste notes to remember.** Paste any text and say *"save this to my brain"*. Claude does the rest.
- **Ask anything about yourself:** *"What are my goals for this year?"*, *"What have I learned about discipline?"*, *"What do I know about X?"*
- **Ask for a second opinion:** *"I'm thinking about doing Y — what do you think based on my patterns?"* Claude pulls from your wiki before answering, so the advice is grounded in who you actually are.
- **Health-check the wiki:** *"Lint the wiki"* or *"health check"* — Claude finds contradictions, missing pages, and gaps.

## What makes this different

Claude never guesses about you. Every answer is grounded in content you actually saved. The more you add, the smarter it gets about you — and the more it starts noticing patterns, contradictions, and connections you'd never spot yourself.
