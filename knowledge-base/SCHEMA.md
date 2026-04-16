# Knowledge Base Schema

## What This Is
A personal knowledge base. Everything here reflects your life — goals, lessons, reflections, decisions, projects, interests, and how they connect over time.

## Context About Me
<!--
CUSTOMIZE THIS SECTION. Replace the placeholder bullets below with a few
lines about who you are, what you do, and what you care about. This is the
first thing Claude reads before answering questions about you. The more
specific and current this is, the better the answers.
-->
- I work as [your role] at [your company or context]
- I'm building / working on [your main project]
- I want to [your main ambition or creative output]
- I care about [what matters to you — learning, health, family, craft, etc.]

## Folder Structure
- `raw/` — your source material. Journals, notes, goals, articles, transcripts. **Never modified.** This is the source of truth. A hook blocks writes here.
- `wiki/` — LLM-generated and LLM-maintained pages. You read it, the LLM writes it. All pages are markdown with `[[backlinks]]`.
- `wiki/index.md` — catalog of every wiki page with a one-line description, grouped by category.
- `wiki/log.md` — chronological record of every ingestion, update, and maintenance action.
- `briefings/`, `content/`, `platforms/` — optional working directories for generated briefings, drafted content, and platform-specific outputs. Use them or delete them.

## Page Types
Create these kinds of pages as needed:

**Entity Pages** — a page for any recurring person, project, company, tool, or concept that appears across multiple sources. Examples: a specific product you're building, a company you work at, a person who keeps coming up.

**Theme Pages** — a page for recurring themes, patterns, or areas of focus. Examples: `[[Career Goals]]`, `[[Content Creation]]`, `[[Self-Improvement]]`, `[[Health and Fitness]]`, `[[Relationships]]`.

**Lesson Pages** — a page for specific lessons you've written or extracted. Each lesson gets filed under the relevant theme page and linked to the context it came from.

**Decision Pages** — a page for major decisions you've made or are considering, with the reasoning, context, and outcome if known.

**Timeline Pages** — optional. If a period of your life has a clear arc (a quarter, a phase, a project), it can get its own page summarizing what happened and linking to the relevant entities and themes.

## Wiki Rules

### Page Format
Every wiki page must follow this structure:
```
# Page Title

One-paragraph summary of what this page is about.

## Key Points
The main content — facts, insights, connections.

## Sources
Links back to raw files this page draws from: [[raw/filename.txt]]

## Related
Links to other wiki pages: [[Related Page 1]], [[Related Page 2]]
```

### Naming
- Use lowercase with hyphens for filenames: `career-goals.md`, `my-project.md`
- Use natural titles inside the file: `# Career Goals`, `# My Project`

### Backlinks
- Every page must link to at least one other page
- When you create or update a page, check if other existing pages should link back to it
- Use `[[page-name]]` format for all internal links

### Index Rules
- `index.md` lists every page grouped by type (Entities, Themes, Lessons, Decisions, Timeline)
- Each entry has the page link and a one-line description
- Update the index every time you create a new page

### Log Rules
- `log.md` is append-only
- Every entry starts with: `## [YYYY-MM-DD] action | source or description`
- Actions are: `ingest`, `update`, `create`, `lint`
- Example: `## [2026-04-06] ingest | goals-2024.txt`
- List which pages were created or updated

## Ingestion Process
When the user tells you to process a new raw file:

1. Read the full file
2. Read `wiki/index.md` to understand what already exists
3. Identify key entities, themes, lessons, decisions, and patterns
4. For each one:
   - If a wiki page already exists: update it with the new information
   - If no page exists and the topic is significant: create a new page
5. Add backlinks between new and existing pages
6. Update `wiki/index.md` with any new pages
7. Append to `wiki/log.md` what you did
8. Tell the user: what pages you created, what pages you updated, and any interesting connections you noticed

## What To Prioritize
- Lessons and patterns that repeat across multiple entries — these are the most valuable
- Goals and how they evolve over time — track changes in what the user wants
- Decisions and their reasoning — the user wants to remember why they chose what they chose
- Connections between different areas of the user's life — how work connects to personal growth connects to content creation
- Contradictions — if the user said one thing in March and the opposite in June, flag it

## What NOT To Do
- Don't create a page for every minor detail. Only things that are significant or recurring.
- Don't editorialize or add motivational commentary. Just organize what the user wrote.
- Don't modify anything in `raw/`. Ever. The hook will block this, but also: don't try.
- Don't create pages with only one sentence of content. If there isn't enough to say, add it to an existing page instead.

## Maintenance (Lint)
When the user asks you to health-check the wiki:
- Find contradictions between pages
- Find orphan pages with no backlinks pointing to them
- Find themes or entities mentioned across multiple pages but lacking their own page
- Find pages that reference raw sources that have been superseded by newer entries
- Suggest new connections between existing pages
- Suggest questions the user should be asking about their own data

## Entity Detection
On every ingestion, scan for mentions of people, companies, tools, and concepts. If they don't have their own page yet and they appear significant, create one. If they do have a page, update it with the new context and append a timeline entry.
