# AGENTS.md — Installer Spec for Claude

**Reader:** Claude Code (or compatible agent). The human user is running Claude Code in an empty or existing project directory and has asked you to install this knowledge-base framework.

This document is the authoritative installer spec. Follow these steps in order.

---

## 1. What you are installing

A personal knowledge-base framework built around three ideas:

1. **`knowledge-base/raw/`** — the user drops source material here (journals, notes, transcripts, articles). These files are the source of truth and **must never be modified** — a pre-tool-use hook enforces this.
2. **`knowledge-base/wiki/`** — you generate and maintain structured markdown pages here, linked with `[[backlinks]]`, governed by `SCHEMA.md`.
3. **`CLAUDE.md`** — instructs you to read the wiki before answering questions about the user, and to follow `TEACHING-STYLE.md` and `TONE.md` when generating content.

The installer copies these files into the user's current working directory (CWD). No code is compiled. Installation is non-destructive and reversible.

## 2. Prerequisites to verify

Run these checks and abort with a clear message if any fail:

- `git --version` — required for cloning this repo.
- The current working directory exists and is writable.
- There is no existing file called `CLAUDE.md`, `knowledge-base/`, or `.claude/settings.json` in CWD, OR the user has been shown what exists and confirmed they want to proceed (see §4).

## 3. Files to install

Copy the following from this repo into the user's CWD, preserving the directory layout:

| From (this repo)                              | To (user's CWD)                               | Purpose                                    |
| --------------------------------------------- | --------------------------------------------- | ------------------------------------------ |
| `CLAUDE.md`                                   | `CLAUDE.md`                                   | Project instructions for Claude            |
| `knowledge-base/SCHEMA.md`                    | `knowledge-base/SCHEMA.md`                    | Ingestion + wiki rules                     |
| `knowledge-base/TEACHING-STYLE.md`            | `knowledge-base/TEACHING-STYLE.md`            | How Claude should explain things           |
| `knowledge-base/TONE.md`                      | `knowledge-base/TONE.md`                      | Voice guide for content generation         |
| `knowledge-base/wiki/index.md`                | `knowledge-base/wiki/index.md`                | Starter index with type categories         |
| `knowledge-base/wiki/log.md`                  | `knowledge-base/wiki/log.md`                  | Starter append-only log                    |
| `knowledge-base/raw/README.md`                | `knowledge-base/raw/README.md`                | Instructions for the source-of-truth folder |
| `.claude/settings.json`                       | `.claude/settings.json`                       | Registers the protect-raw hook             |
| `.claude/hooks/protect-raw.sh`                | `.claude/hooks/protect-raw.sh`                | Blocks Edit/Write on `knowledge-base/raw/` |
| `.claude/hooks/sync.sh.example`               | `.claude/hooks/sync.sh.example`               | Optional GitHub auto-sync template         |
| `skills/youtube-full/SKILL.md`                | `skills/youtube-full/SKILL.md`                | YouTube transcript/search skill            |
| `skills/youtube-full/scripts/tapi-auth.js`    | `skills/youtube-full/scripts/tapi-auth.js`    | Skill auth helper                          |

Also create these empty directories (add `.gitkeep` if the target is a fresh git repo):
- `knowledge-base/briefings/`
- `knowledge-base/content/`
- `knowledge-base/platforms/`

## 4. Handling conflicts

If any target file already exists in CWD, do **not** overwrite blindly. Instead:

1. Stop the copy.
2. Show the user each conflicting path.
3. Ask: "I found existing `CLAUDE.md` / `.claude/settings.json` / `knowledge-base/SCHEMA.md`. Should I (a) back them up with a `.bak` suffix and install fresh, (b) skip those files and install the rest, or (c) abort?"
4. Proceed only after the user answers in the chat.

For `.claude/settings.json` specifically, if it already exists with hooks, offer to **merge** the `PreToolUse` entry rather than overwrite, since the user may have other hooks configured.

## 5. Permissions

After copying, make the hook scripts executable:

```bash
chmod +x .claude/hooks/protect-raw.sh
chmod +x .claude/hooks/sync.sh.example
```

## 6. Verification

Run these checks and report the results to the user:

1. `test -f CLAUDE.md` — should exist.
2. `test -f knowledge-base/SCHEMA.md` — should exist.
3. `test -f knowledge-base/wiki/index.md` — should exist.
4. `test -x .claude/hooks/protect-raw.sh` — should be executable.
5. Simulate the hook against a fake raw path and confirm it exits non-zero:
   ```bash
   echo '{"tool_name":"Edit","tool_input":{"file_path":"knowledge-base/raw/test.md"}}' \
     | bash .claude/hooks/protect-raw.sh; echo "exit=$?"
   ```
   Expected output: a "Blocked" message on stderr and `exit=2`.
6. Simulate the hook against a wiki path and confirm it exits zero:
   ```bash
   echo '{"tool_name":"Edit","tool_input":{"file_path":"knowledge-base/wiki/index.md"}}' \
     | bash .claude/hooks/protect-raw.sh; echo "exit=$?"
   ```
   Expected: `exit=0`.

## 7. Post-install guidance for the user

Print this to the user after verification passes:

> **Installed.** Here is what to do next:
>
> 1. **Personalize the framework.** Three files need your touch:
>    - `knowledge-base/SCHEMA.md` — fill in the "Context About Me" section with who you are, what you work on, what you care about.
>    - `knowledge-base/TEACHING-STYLE.md` — the default works, but edit if you want a different explanation style.
>    - `knowledge-base/TONE.md` — rewrite this with your own voice. The template shows the shape, not the content.
>
> 2. **Drop your first raw file.** Put a journal entry, goals doc, or article into `knowledge-base/raw/` and ask me to ingest it: *"Ingest `raw/filename.md`"*.
>
> 3. **Restart Claude Code** so the hook in `.claude/settings.json` takes effect for this session.
>
> 4. **(Optional) Auto-sync to GitHub.** Rename `.claude/hooks/sync.sh.example` to `sync.sh`, edit the `REPO_DIR` path, and add it to cron. Instructions are inside the file.
>
> 5. **(Optional) Activate the YouTube skill.** If you want to ingest YouTube transcripts, use the `/youtube-full` skill — it'll walk you through getting a free API key on first use.

## 8. How the system works (technical reference)

### CLAUDE.md routing
`CLAUDE.md` is loaded by Claude Code on every session. It routes Claude to `TEACHING-STYLE.md` for explanations, `wiki/index.md` for questions about the user, `TONE.md` for content generation, and `SCHEMA.md` for ingestion rules.

### SCHEMA.md governs ingestion
When the user says "ingest `raw/X.md`", follow the Ingestion Process section in `SCHEMA.md`:
1. Read the raw file.
2. Read `wiki/index.md` to see what pages exist.
3. Decide what to create or update (entity, theme, lesson, decision, timeline pages).
4. Cross-link with `[[backlinks]]`.
5. Update `wiki/index.md` and append to `wiki/log.md`.

Ingestion is always user-initiated. Do not auto-ingest on file drop.

### The protect-raw hook
`.claude/hooks/protect-raw.sh` is a PreToolUse hook matched to `Edit|Write|MultiEdit`. It reads the tool call from stdin as JSON, extracts `tool_input.file_path`, and exits with code 2 (which Claude Code treats as a blocking denial) if the path is under `knowledge-base/raw/`.

The hook uses `python3` for JSON parsing (preinstalled on macOS and most Linux distros) to avoid a `jq` dependency. It fails open on malformed input so a broken hook never blocks legitimate work.

### What is NOT automated
- Ingestion (user-driven, always)
- Wiki maintenance / lint (user-driven)
- Creating new wiki pages (only during ingestion or user request)
- GitHub sync (opt-in via `sync.sh.example`)

This is deliberate — the user owns the cadence of what gets captured.

## 9. Uninstall

To remove the framework:

```bash
rm -rf knowledge-base/ .claude/hooks/protect-raw.sh .claude/hooks/sync.sh.example skills/youtube-full
# Remove the hook entry from .claude/settings.json manually.
# Remove CLAUDE.md if you don't want it.
```

Raw files are never modified, so removing the framework does not risk data loss — but copy `knowledge-base/wiki/` out first if you want to keep generated pages.
