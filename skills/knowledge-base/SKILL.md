---
name: knowledge-base
description: "Personal knowledge base wiki. Use when the user forwards a link to save, pastes notes or content to remember, asks questions about things they've learned, references their wiki, goals, lessons, personal growth, blind spots, patterns, says \"ingest this\", \"save this\", \"what do I know about\", \"check my wiki\", \"knowledge base\", or asks for an evening recap. Also use when the user asks any introspective question about themselves — their goals, decisions, habits, strengths, weaknesses, or patterns in their life. Also use when the user asks for advice, a second opinion, feedback on a decision, or wants to talk through a problem. The wiki contains their goals, thinking patterns, past decisions, lessons learned, and personal reflections — always consult it before responding so the advice is grounded in who they actually are, not generic. Also use when the user sends any URL — YouTube, X/Twitter, TikTok, Instagram, or any article link. If the user sends a bare URL with no text, this skill handles it."
---

# Knowledge Base

## When the user sends a link or content to save:

IMPORTANT: All steps below happen automatically in sequence.
Do not stop after fetching. Do not ask the user for confirmation
between steps. Complete the entire flow every time.

### Step 1: Fetch the content based on platform

CRITICAL: Match the URL FIRST, then use the correct tool.
Do NOT try web_fetch on platforms that block it.

- Any URL containing x.com or twitter.com → ALWAYS use Apify. Never try web_fetch.
  First fetch the original tweet only. Then check:
    - If the tweet is a thread starter (numbered list, "thread:", "🧵",
      "1/", or a hook with no real content), fetch the full thread
      using conversationIds
    - If the tweet is a standalone post with complete content,
      do NOT fetch replies
    - If unsure, save what you have and ask the user:
      "Looks like this might be a thread. Want me to fetch replies?"
- youtube.com or youtu.be → ALWAYS use youtube-full skill
- tiktok.com → ALWAYS use Apify. Never try web_fetch.
- instagram.com → ALWAYS use Apify. Never try web_fetch.
- All other links → try web_fetch first, fall back to Apify if blocked

If Apify is not configured and the URL is from X/TikTok/Instagram, tell the
user: "This link is from [platform], which needs Apify set up to fetch.
See the README for setup instructions, or paste the content manually and
I'll save it." Do not attempt web_fetch on blocked platforms.

### Step 2: Save to raw

Save the extracted content to `knowledge-base/raw/` as a markdown file with a
descriptive filename based on the content title or topic.

### Step 3: Get personalized explanation from Claude and respond immediately

Run this command (from the project root — the folder the user set up Claude in):

```
claude -p "Read knowledge-base/TEACHING-STYLE.md for explanation style.
Read knowledge-base/wiki/index.md.
Then read this new source: knowledge-base/raw/[FILENAME].
Write a personalized explanation following TEACHING-STYLE.md exactly."
```

Send this explanation to the user immediately. Do not wait for wiki processing.
Do NOT rephrase, summarize, or add your own commentary. Send Claude's explanation as-is.

### Step 4: Process into wiki in background

Then run this command:

```
claude -p "Read knowledge-base/SCHEMA.md. Process knowledge-base/raw/[FILENAME]
into the wiki. Read wiki/index.md to see what exists. Create or update wiki
pages, update index.md, and append to log.md. Tell me what you created
and updated."
```

When done, send a brief follow-up: "Wiki updated: [list of pages created/updated]"

## When the user asks a question about their knowledge:

1. Run this command:

   ```
   claude -p "Read knowledge-base/TEACHING-STYLE.md for explanation style.
   Read knowledge-base/SCHEMA.md. Then read knowledge-base/wiki/index.md.
   Find and read relevant wiki pages to answer this question: [USER'S QUESTION].
   Follow backlinks if you need more context. Cite which wiki pages you used.
   Explain following TEACHING-STYLE.md exactly."
   ```

2. Do NOT rephrase. Send Claude's answer as-is.

## When the user says "health check" or "lint the wiki":

1. Run this command:

   ```
   claude -p "Read knowledge-base/SCHEMA.md. Then review the entire wiki/ directory.
   Find contradictions, orphan pages, missing cross-references, and gaps.
   Suggest improvements."
   ```

2. Send the findings.

## Rules

- Always run `claude` commands from the project root (the folder where `CLAUDE.md` lives — this is the folder the user opened in Claude Code).
- Never modify files in `knowledge-base/raw/`. A pre-tool-use hook blocks this; if Claude -p tries to write there, it will fail — do not retry.
- If a `claude` command fails, report the error to the user.
- Always send the personalized explanation BEFORE listing wiki changes.
- Never rephrase or summarize Claude's output. Pass it through as-is.
