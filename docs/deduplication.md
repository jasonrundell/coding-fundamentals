# Deduplicating Existing Cursor Guidance

Use this checklist after installing the global fundamentals pack. The goal is one source of truth for common behavior and project-local rules only where they add real context.

## Inventory

Review these locations:

- User-level Cursor rules.
- User-level Cursor skills.
- Project `.cursor/rules/*.mdc`.
- Project `.cursor/skills/*/SKILL.md`.
- Project `AGENTS.md` files.

## Classify Each Rule Or Skill

Keep project-specific guidance when it contains:

- Domain facts.
- Product workflows.
- Deployment invariants.
- Named MCP server routing.
- Team or organization process.
- App-specific gotchas.

Move into the global pack when it contains:

- Broad engineering defaults.
- Commit handling preferences.
- Verification discipline.
- Secrets safety.
- Required-data error handling.
- Documentation expectations.
- Project index maintenance.

Replace with opt-in templates when it contains:

- React/TypeScript defaults.
- Supabase or database safety.
- Accessibility and SEO expectations.
- CSS or Tailwind reuse rules.
- Documentation conventions.

Remove, disable, or archive when it duplicates:

- `rules/global-fundamentals.mdc`.
- `rules/agent-operating-defaults.mdc`.
- `rules/project-index.mdc`.
- Any optional rule template already installed for the project.

## Safe Cleanup Process

1. Disable or archive before deleting if the rule’s purpose is unclear.
2. Avoid duplicate `alwaysApply: true` rules for the same principle.
3. Keep project-specific rules in the project where they matter.
4. Record replacements in the project index or local docs.
5. Re-run a normal task after cleanup to confirm the agent still has the right context.

## High-Confidence Duplicates

These are usually safe to consolidate:

- “Make changes but do not handle commits.”
- Conventional Commit guidance.
- “Index projects and keep index up to date.”
- “Do not use fallback data; log and throw or surface errors.”
- Supabase RLS and manual migration guidance.
- React/TypeScript default frontend standards.
- Windows, macOS, and Linux documentation requirements.

## What Not To Publish

Do not include private or project-specific guidance in this public pack:

- Product-specific delivery rules.
- Azure DevOps project routing.
- Named personas tied to one organization.
- Vercel deploy invariants for one app.
- Sabre GDS behavior.
- Private MCP server names.
- Secrets, database URLs, or environment variable values.
