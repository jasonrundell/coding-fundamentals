# Workflow Improvement Loop

Use this loop after meaningful AI-assisted work to decide whether a lesson should become reusable guidance.

The loop favors reviewed updates over automatic mutation. Agents can detect friction and propose changes, but durable rules, skills, and docs should change only when the lesson is clear.

## The Loop

1. Observe the workflow.
2. Score the affected artifact with `docs/self-assessment.md`.
3. Propose the smallest durable improvement.
4. Validate the repo health checks.
5. Update the right artifact.
6. Record the decision in `docs/learning-log.md`.

## Observe

Look for friction that repeated or materially slowed the work:

- The agent searched broadly because the project index was stale.
- The user corrected the same behavior more than once.
- A term was unclear across docs, prompts, code, or tests.
- A verification step was missing, slow, flaky, or too broad.
- A rule or skill pulled too much unrelated context into the task.
- New AI tooling made a previously expensive feedback step practical.

Do not promote a lesson just because it happened once. Prefer evidence from repeated tasks, costly misses, or clearly general workflow improvements.

## Propose

A good proposal names:

- The observed friction.
- The affected principle.
- The smallest file to change.
- The expected behavior after the change.
- The validation command or manual check that proves the update did not break the pack.

Prefer updating one of these artifacts:

- `PROJECT_INDEX.md` when agents need better navigation.
- `rules/*.mdc` when the behavior is concise and project-template friendly.
- `skills/*/SKILL.md` when the workflow is opt-in and multi-step.
- `docs/*.md` when the lesson explains usage, assessment, installation, or maintenance.

## Review Gate

Before updating reusable guidance, ask:

- Is this project-specific, personal, or broadly reusable?
- Does it belong in a tiny always-on rule, an optional rule, a skill, or docs?
- Does it duplicate existing guidance?
- Can an agent discover it without loading too much context?
- Is there a clear verification step?

If the answer is unclear, record the lesson as deferred in `docs/learning-log.md` instead of changing rules.

## Validate

Run the validation script before finishing changes that affect docs, rules, skills, scripts, or the project index.

Windows:

```powershell
.\scripts\validate.ps1
```

macOS:

```bash
./scripts/validate.sh
```

Linux:

```bash
./scripts/validate.sh
```

## Record

Use short learning-log entries. Capture why the update exists, not a transcript of the task.

Example:

```text
Date: 2026-04-27
Status: Accepted
Workflow: Rule-pack maintenance
Lesson: Agents need a health check before changing reusable guidance.
Changed: Added validation scripts and self-assessment docs.
Verification: Ran scripts/validate.sh.
```
