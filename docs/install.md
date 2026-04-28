# Installation

This pack supports two installation styles:

- **Personal global install:** copy the tiny global rule and opt-in skills to your Cursor user config so they are available across projects.
- **Project install:** copy selected rules or skills into a project’s `.cursor/` folder.

The scripts are conservative. They create folders and copy missing files, but they do not overwrite existing files unless you pass a force flag.

## What To Install

Recommended personal global install:

- `rules/global-fundamentals.mdc`
- `skills/coding-fundamentals/`

Optional project templates:

- `rules/agent-operating-defaults.mdc`
- `rules/project-index.mdc`
- `rules/database-supabase.mdc`
- `rules/react-typescript.mdc`
- `rules/web-accessibility-seo.mdc`
- `rules/css-style-reuse.mdc`
- `rules/documentation.mdc`

## Windows

From PowerShell at the repository root:

```powershell
.\scripts\install.ps1
```

To overwrite files that already exist:

```powershell
.\scripts\install.ps1 -Force
```

Manual install:

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.cursor\rules" | Out-Null
New-Item -ItemType Directory -Force "$env:USERPROFILE\.cursor\skills" | Out-Null
Copy-Item "rules\global-fundamentals.mdc" "$env:USERPROFILE\.cursor\rules\global-fundamentals.mdc"
Copy-Item "skills\coding-fundamentals" "$env:USERPROFILE\.cursor\skills\" -Recurse
```

## macOS

From a terminal at the repository root:

```bash
./scripts/install.sh
```

If needed, make the script executable first:

```bash
chmod +x ./scripts/install.sh
./scripts/install.sh
```

To overwrite files that already exist:

```bash
./scripts/install.sh --force
```

Manual install:

```bash
mkdir -p "$HOME/.cursor/rules" "$HOME/.cursor/skills"
cp "rules/global-fundamentals.mdc" "$HOME/.cursor/rules/global-fundamentals.mdc"
cp -R "skills/coding-fundamentals" "$HOME/.cursor/skills/"
```

## Linux

From a terminal at the repository root:

```bash
./scripts/install.sh
```

If needed, make the script executable first:

```bash
chmod +x ./scripts/install.sh
./scripts/install.sh
```

To overwrite files that already exist:

```bash
./scripts/install.sh --force
```

Manual install:

```bash
mkdir -p "$HOME/.cursor/rules" "$HOME/.cursor/skills"
cp "rules/global-fundamentals.mdc" "$HOME/.cursor/rules/global-fundamentals.mdc"
cp -R "skills/coding-fundamentals" "$HOME/.cursor/skills/"
```

## Installing Optional Rule Templates

Optional rule templates are usually better installed per project:

```bash
mkdir -p .cursor/rules
cp rules/project-index.mdc .cursor/rules/
cp rules/react-typescript.mdc .cursor/rules/
```

On Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force ".cursor\rules" | Out-Null
Copy-Item "rules\project-index.mdc" ".cursor\rules\"
Copy-Item "rules\react-typescript.mdc" ".cursor\rules\"
```

## After Installing

1. Restart Cursor or reload the window if the new rules/skills are not picked up.
2. Use `docs/deduplication.md` to remove overlapping old rules.
3. Keep only small, stable guidance always-on.

## Validating This Pack

Run validation after changing docs, rules, skills, scripts, or `PROJECT_INDEX.md`.

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
