---
name: technical-writing
description: >
  Apply this skill whenever writing or editing any Markdown (.md) files,
  including READMEs, documentation, SKILL.md files, changelogs, or any
  prose destined for a .md file. Enforces an 80-character line limit on
  all prose, runs the bundled mdlint.sh linter after every write, and
  fixes violations before responding. TRIGGER on: creating .md files,
  editing documentation, writing READMEs, updating SKILL.md files,
  producing any Markdown output that will be saved to disk.
allowed-tools: Read Write Edit Bash(bash:*)
metadata:
  author: nerp
  status: Completed
  last_updated: 2026-05-03
---

# Technical Writing

_Enforces 80-character line limits and consistent prose style in all
Markdown files, using a standards-based Python linter._

## Non-Negotiable Rule

Every `.md` file you write or edit MUST have all prose lines ≤ 80
characters before the task is considered complete.

**Exception:** Content inside fenced code blocks (` ``` `) and indented
code blocks is fully exempt. Never break long commands, URLs, or code
samples across lines to satisfy the prose width limit.

## Linter Tool

The skill bundles `scripts/mdlint.sh`, a wrapper around `pymarkdownlnt`
(the standard Python implementation of the markdownlint rule set). It
enforces MD013 (line length) with code blocks excluded.

**Check a file:**

```sh
bash /path/to/technical-writing/scripts/mdlint.sh <file.md>
```

- Exit 0 → file is clean.
- Exit 1 → violations listed with line numbers; fix and re-run.
- Auto-installs `pymarkdownlnt` via pip if not already present.

## Mandatory Workflow

Follow these steps for every `.md` file you write or edit:

1. Write or edit the file (aim for ≤ 80 chars per line while drafting).
2. Run `bash scripts/mdlint.sh <file>`.
3. If violations are reported, fix the offending lines and return to
   step 1.
4. Only mark the task done when the linter exits 0.

## Style Rules

- **Line length:** Hard-wrap prose at 80 characters. Use actual newlines,
  not soft/visual wrapping.
- **Headings:** Use ATX style (`#`, `##`, `###`) — not underline style.
- **Spacing:** One blank line between sections; no trailing whitespace.
- **Code blocks:** Fenced (` ``` `) or indented blocks are exempt from
  the line-length rule. Do not split code to fit prose width.
- **Lists:** Continuation lines must be indented to align with list text,
  and must also respect the 80-character limit.
