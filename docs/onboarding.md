# Onboarding

Use this guide when introducing the fundamentals pack to a new or existing Cursor project.

The goal is not to make every rule always-on. Start with the tiny global rule, add only the templates that match the project, and use skills when a workflow needs deliberate context.

## First-Time Setup

Install the global rule and orchestrator skill once per machine, then copy project templates only where they fit.

Windows:

```powershell
.\scripts\install.ps1
```

macOS:

```bash
chmod +x ./scripts/install.sh
./scripts/install.sh
```

Linux:

```bash
chmod +x ./scripts/install.sh
./scripts/install.sh
```

After installing, restart Cursor or reload the window if rules or skills do not appear.

## Starting A New Project

For a new project, use this pack to establish lightweight defaults before the first major feature lands.

Prompt:

```text
Use the coding-fundamentals skill to help set up this new project for AI-assisted development. Start by creating a lean PROJECT_INDEX.md, then recommend which optional rule templates should be copied into .cursor/rules for this stack. Do not add unrelated rules.
```

Expected result:

- The agent loads the `coding-fundamentals` skill for the setup workflow.
- The agent reads the repo structure before proposing rules.
- `PROJECT_INDEX.md` explains the important directories, project purpose, and when agents should read key files.
- Only relevant templates are suggested. For example, a React app may use `react-typescript.mdc`, `web-accessibility-seo.mdc`, `css-style-reuse.mdc`, and `documentation.mdc`; a backend-only project may skip UI rules.
- The agent should ask before copying templates if the stack or project goals are unclear.

Follow-up prompt:

```text
Copy the recommended rule templates into this project and update PROJECT_INDEX.md so future agents know where to start. Keep the rules opt-in unless the template already says otherwise.
```

Expected result:

- The selected templates appear under `.cursor/rules/`.
- The index mentions the local rule files and any project-specific navigation notes.
- The agent validates the change with the project checks that exist, or explains why no checks exist yet.

## Adding The Pack To An Existing Project

Existing projects often already have rules, skills, docs, or an `AGENTS.md`. Start by reducing overlap.

Prompt:

```text
Review this project for overlapping Cursor rules, skills, AGENTS.md guidance, and project docs. Use docs/deduplication.md from the fundamentals pack as the checklist. Recommend what to keep project-local, what to replace with pack templates, and what to archive. Do not delete anything yet.
```

Expected result:

- The agent inventories current guidance instead of adding more by default.
- Project-specific facts stay local.
- Broad defaults, such as commit handling, verification habits, CSS reuse, and documentation requirements, are mapped to the reusable templates where appropriate.
- The agent identifies duplicate always-on rules that may waste context or conflict.

Follow-up prompt:

```text
Apply the cleanup plan. Archive unclear guidance instead of deleting it, copy only the selected templates, and update PROJECT_INDEX.md with the final rule and skill layout.
```

Expected result:

- Guidance becomes easier to discover and less repetitive.
- The project keeps domain-specific rules close to the codebase.
- The index reflects the new navigation path for future agents.

## Using Rules During Feature Work

Rules work best when the prompt names the project context, the expected verification, and the relevant files.

React feature prompt:

```text
Implement the account settings form in this React TypeScript app. Follow the local React, CSS reuse, accessibility, and documentation rules. Read PROJECT_INDEX.md first, then inspect only the settings-related components and tests. Add or update focused tests and run them before finishing.
```

Expected result:

- The agent starts from the index, then reads focused files.
- Repeated Tailwind class strings are extracted when they meet the project rule threshold.
- Form labels, keyboard behavior, and user-facing copy receive accessibility attention.
- Tests are added or updated near the changed behavior, then run in non-watch mode.

Supabase prompt:

```text
Add a projects table and the policies needed for authenticated users to manage their own projects. Follow the local Supabase rule. Do not use fallback data, and make sure Row Level Security is enabled.
```

Expected result:

- The agent treats the database change as a migration or SQL artifact, depending on the project.
- RLS is explicitly enabled.
- Policies are created with the feature rather than deferred.
- Missing required data is surfaced as an error instead of silently replaced with fallback values.

Documentation prompt:

```text
Update the deployment guide for the new environment variable. Follow the documentation rule and include Windows, macOS, and Linux instructions. Keep the instructions practical and testable.
```

Expected result:

- The guide includes platform-specific command examples where setup differs.
- Required values are described without exposing secrets.
- The project index is updated if the documentation changes how agents should navigate the repo.

## Using Skills For Larger Workflow Changes

Use the orchestrator skill when the task is about creating, refreshing, or reviewing the fundamentals skill family. It is intentionally opt-in because it carries more process context than an always-on rule should.

Prompt:

```text
Use the coding-fundamentals skill to review our current AI guidance. Identify which child skills or rules should exist, where responsibilities overlap, and what the smallest durable improvement would be.
```

Expected result:

- The agent loads the skill only for the workflow review.
- The output separates always-on rules, optional project templates, and opt-in skills.
- Recommendations include a validation step and a short learning-log entry when durable guidance changes.

Prompt:

```text
Use the coding-fundamentals skill to turn this repeated workflow issue into reusable guidance: agents keep editing broad files without checking the project index first. Propose the smallest rule, skill, or doc update and explain how to validate it.
```

Expected result:

- The agent treats the issue as a guidance design problem, not just a code edit.
- The proposed change names the affected artifact and why it belongs there.
- The agent avoids expanding always-on context unless the behavior is truly universal.

## Prompt Patterns That Work Well

Use these patterns when asking agents to apply the pack:

- "Read `PROJECT_INDEX.md` first, then inspect only the files relevant to..."
- "Follow the local `react-typescript`, `css-style-reuse`, and `web-accessibility-seo` rules for this UI change."
- "Before changing durable guidance, use `docs/self-assessment.md` and `docs/workflow-improvement-loop.md`."
- "Do not create commits. Run the relevant validation commands before finishing."
- "If required data is missing, log and throw or surface a clear error instead of using fallback data."
- "Update `PROJECT_INDEX.md` if this change affects how future agents should navigate the project."

## What Good Onboarding Looks Like

Good onboarding produces a smaller, clearer context surface:

- New users can install the global rule and skill without understanding every optional template.
- New projects get an index and a few relevant local rules before they accumulate friction.
- Existing projects remove duplicate guidance before adding more.
- Agents know what to read, what to ignore, and how to validate their changes.
