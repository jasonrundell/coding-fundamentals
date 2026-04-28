# Global Cursor Fundamentals Pack

Reusable Cursor rules, skills, and install helpers for sustainable AI-assisted software development.

The pack turns a few durable software fundamentals into Cursor guidance:

- Good codebases matter more with AI, not less.
- Align on the design concept before generating large artifacts.
- Use ubiquitous language so humans, code, and agents share terms.
- Work in small verified steps because feedback rate is the speed limit.
- Prefer deep modules with simple interfaces.
- Design interfaces deliberately, then delegate implementation behind tests.
- Keep context lean so the agent spends attention on the work that matters.

## What Is Included

- `rules/global-fundamentals.mdc`: tiny always-on rule for personal global use.
- `rules/*.mdc`: optional rule templates for common project concerns.
- `skills/fundamentals-skill-orchestrator/SKILL.md`: opt-in skill for creating or refreshing the full fundamentals skill family.
- `docs/concepts.md`: short explanation of the core principles.
- `docs/install.md`: Windows, macOS, and Linux install instructions.
- `docs/deduplication.md`: guidance for removing overlapping personal or project rules.
- `docs/self-assessment.md`: scorecard for reviewing rules, skills, docs, and workflows.
- `docs/workflow-improvement-loop.md`: reviewed loop for turning AI workflow lessons into durable guidance.
- `docs/learning-log.md`: concise record of accepted or deferred workflow lessons.
- `scripts/install.ps1` and `scripts/install.sh`: conservative install scripts.
- `scripts/validate.ps1` and `scripts/validate.sh`: repo health checks for docs, rules, scripts, and index entries.

## Recommended Use

Install the tiny global rule everywhere, then opt into rule templates and skills per project.

Avoid making the entire philosophy always-on. The full orchestrator skill contains workflow detail and source references; use it when needed rather than injecting it into every conversation.

## Quick Start

Read `docs/install.md` for platform-specific instructions.

Typical setup:

1. Copy `rules/global-fundamentals.mdc` into your user-level Cursor rules.
2. Copy `skills/fundamentals-skill-orchestrator/` into your user-level Cursor skills.
3. Copy optional `rules/*.mdc` templates into projects that need them.
4. Use `docs/deduplication.md` to remove duplicate local guidance.

## Rule Strategy

`global-fundamentals.mdc` is intentionally short and can be always-on.

Other rules are templates and default to `alwaysApply: false`. Enable them only where they fit the project.

## Self-Assessment

Use `docs/self-assessment.md` and `docs/workflow-improvement-loop.md` after meaningful AI-assisted work. The project should notice repeated friction, propose small guidance updates, validate them, and record accepted lessons in `docs/learning-log.md`.

Run repo health checks before finishing changes to reusable guidance:

Windows:

```powershell
.\scripts\validate.ps1
```

macOS and Linux:

```bash
./scripts/validate.sh
```

## Contributing

Keep contributions small and portable:

- Prefer one concern per rule or skill.
- Keep rules concise, ideally under 50 lines.
- Do not include project-specific secrets, organization names, database identifiers, or private workflow details.
- Include Windows, macOS, and Linux notes when changing installation docs.
- Run the validation script after changing docs, rules, skills, scripts, or `PROJECT_INDEX.md`.

## License

MIT. See `LICENSE`.

## Kudos

Kudos to Matt Pocock for his talk ["Software Fundamentals Matter More Than Ever"](https://www.youtube.com/watch?v=v4F1gFy-hqg) which came to me at the perfect time and inspired me to finally get my AI house in order.