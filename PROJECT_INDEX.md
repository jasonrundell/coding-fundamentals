# Project Index

Lean index for AI agents working in this repo. Read this first to understand what exists, what to open, and what to keep updated.

## How To Use

- Start here, then open only the files relevant to the task.
- Prefer targeted reads and searches over loading entire large files.
- Update this index whenever adding, moving, deleting, or materially changing project files.

## Current Structure

```text
.
├── .cursor/
│   ├── rules/
│   │   └── project-index.mdc
│   └── skills/
│       └── fundamentals-skill-orchestrator/
│           └── SKILL.md
├── docs/
│   ├── concepts.md
│   ├── deduplication.md
│   └── install.md
├── rules/
│   ├── agent-operating-defaults.mdc
│   ├── css-style-reuse.mdc
│   ├── database-supabase.mdc
│   ├── documentation.mdc
│   ├── global-fundamentals.mdc
│   ├── project-index.mdc
│   ├── react-typescript.mdc
│   └── web-accessibility-seo.mdc
├── scripts/
│   ├── install.ps1
│   └── install.sh
├── skills/
│   └── fundamentals-skill-orchestrator/
│       └── SKILL.md
├── LICENSE
├── PROJECT_INDEX.md
└── README.md
```

## Files

| Path | Purpose | Read When |
| --- | --- | --- |
| `README.md` | Public overview, quick start, contribution notes, and rule strategy. | Explaining the project or onboarding a user. |
| `PROJECT_INDEX.md` | AI-oriented map of the repo and maintenance rules. | Starting any task or changing project structure. |
| `LICENSE` | MIT license for open-source use. | Answering license or reuse questions. |
| `rules/global-fundamentals.mdc` | Tiny always-on rule for sustainable AI-assisted coding across projects. | Installing personal global Cursor guidance. |
| `rules/agent-operating-defaults.mdc` | Optional personal defaults for commits, verification, secrets, required data, and non-watch tests. | A user wants their recurring agent preferences in a project. |
| `rules/project-index.mdc` | Reusable rule template for keeping `PROJECT_INDEX.md` current. | Adding index maintenance to another repo. |
| `rules/database-supabase.mdc` | Optional Supabase/database safety template. | A project uses Supabase, migrations, SQL, RLS, or `setup.sql`. |
| `rules/react-typescript.mdc` | Optional React and TypeScript conventions. | A frontend TypeScript project needs common coding defaults. |
| `rules/web-accessibility-seo.mdc` | Optional accessibility and SEO quality rule. | Editing web UI, routed pages, or user-facing markup. |
| `rules/css-style-reuse.mdc` | Optional style reuse rule for class strings, styling modules, and design tokens. | Editing repeated classes or component styling. |
| `rules/documentation.mdc` | Optional portable documentation rule. | Writing or updating docs, rules, skills, or install instructions. |
| `skills/fundamentals-skill-orchestrator/SKILL.md` | Canonical reusable skill that orchestrates the fundamentals child-skill family. | Creating, refreshing, or reviewing the fundamentals skill stack. |
| `.cursor/skills/fundamentals-skill-orchestrator/SKILL.md` | Local/project copy of the orchestrator skill. | Using this repo inside Cursor as a consumer example. |
| `.cursor/rules/project-index.mdc` | Local/project rule reminding agents to keep this index current. | Editing files in this repo that affect navigation. |
| `docs/concepts.md` | Short explanation of the fundamentals behind the pack. | Explaining why the pack is structured this way. |
| `docs/install.md` | Windows, macOS, and Linux install instructions. | Installing globally or copying optional templates. |
| `docs/deduplication.md` | Checklist for removing overlapping personal and project rules. | Cleaning up old Cursor guidance after installing the pack. |
| `scripts/install.ps1` | Conservative Windows PowerShell installer. | Installing the global rule and orchestrator skill on Windows. |
| `scripts/install.sh` | Conservative macOS/Linux installer. | Installing the global rule and orchestrator skill on macOS or Linux. |

## Agent Notes

- This repo is an open-source Cursor rules and skills pack, not application runtime code.
- Keep `rules/global-fundamentals.mdc` tiny; put detailed behavior into opt-in rule templates or skills.
- Keep `.cursor/` as local/example consumer config. The canonical reusable assets live in top-level `rules/` and `skills/`.
- Keep future entries lean: path, purpose, and when to read. Add detail only when it helps agents avoid broad exploration.

## Maintenance Checklist

- [ ] Add new files or directories that future agents should know about.
- [ ] Remove entries for deleted or moved files.
- [ ] Update purposes when a file’s role changes.
- [ ] Keep paths relative to the repo root.
- [ ] Keep the structure tree aligned with the actual project layout.
