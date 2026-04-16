# raw/

This folder is your source of truth. Drop any of the following here:

- Journal entries, reflections, morning pages
- Goals documents, reviews, self-assessments
- Articles, essays, transcripts you want to ingest
- Meeting notes, voice memo transcriptions
- Anything you want the wiki to be built from

## Rules

1. **Files in this folder are never modified.** A Claude Code hook (`.claude/hooks/protect-raw.sh`) blocks Edit/Write tool calls that target this path. If you need to correct a raw file, edit it yourself outside of Claude.

2. **Filenames matter.** Use descriptive, dated names when possible:
   - `2026-01-15-morning-journal.md`
   - `goals-2026.md`
   - `some-article-title.md`

3. **Any format works.** Markdown, plain text, transcripts, whatever. Claude reads them all.

## Workflow

1. Drop a file here.
2. Tell Claude: *"Ingest `raw/the-file-name.md`"*.
3. Claude follows the process in [SCHEMA.md](../SCHEMA.md#ingestion-process): reads the file, checks `wiki/index.md` for existing pages, creates or updates wiki pages, adds backlinks, updates the index, and appends to `wiki/log.md`.

This stays manual on purpose — you decide what's worth ingesting and when.
