# Learning Log

Record accepted or deferred workflow lessons here when AI-assisted work reveals reusable guidance.

Keep entries short. This file is not a changelog; it explains why the guidance pack learned something.

## Entry Format

```text
Date:
Status: Accepted | Deferred | Rejected
Workflow:
Lesson:
Changed:
Verification:
```

## Entries

### 2026-04-27

```text
Date: 2026-04-27
Status: Accepted
Workflow: New-user onboarding
Lesson: Users need concrete prompts and expected outcomes to apply the rules and skills pack safely in new and existing projects.
Changed: Added docs/onboarding.md and linked it from README.md and PROJECT_INDEX.md.
Verification: Run scripts/validate.ps1 on Windows or scripts/validate.sh on macOS and Linux.
```

```text
Date: 2026-04-27
Status: Accepted
Workflow: Rule-pack maintenance and self-assessment
Lesson: The project needs an explicit loop for assessing workflow drift before updating durable AI guidance.
Changed: Added self-assessment, workflow-improvement, learning-log, and validation artifacts.
Verification: Run scripts/validate.ps1 on Windows or scripts/validate.sh on macOS and Linux.
```

## Platform Notes

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
