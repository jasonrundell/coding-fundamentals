# Self-Assessment

Use this scorecard to review rules, skills, docs, and agent workflows before turning one-off lessons into reusable guidance.

The goal is not to automate every decision. The goal is to help the project notice drift, propose focused improvements, and keep humans responsible for durable guidance.

## When To Assess

Run this review when:

- A workflow repeatedly needs the same user correction.
- An agent spends time rediscovering project structure or terminology.
- A rule, skill, or doc grows beyond one clear concern.
- A task finishes with avoidable test, lint, install, or verification failures.
- New AI tooling changes what feedback is cheap enough to run every time.

## Scorecard

Score each area from 0 to 2.

- `0`: Missing or working against the principle.
- `1`: Present but inconsistent, too vague, or hard to apply.
- `2`: Clear, focused, and supported by evidence.

### Design Concept

- Does the guidance help the agent clarify intent before producing large artifacts?
- Does it separate strategic decisions from implementation details?
- Does it expose assumptions, constraints, and dependent decisions?

### Ubiquitous Language

- Do docs, rules, skills, tests, and code use the same terms?
- Are synonyms, overloaded terms, or renamed concepts called out?
- Can an agent search for the term and find the right files quickly?

### Feedback Loops

- Does the workflow name the cheapest useful verification step?
- Are tests, linting, builds, screenshots, logs, or manual checks used before finishing?
- Does the guidance discourage large unverified edits?

### Deep Modules

- Is the artifact focused on one concern?
- Does it hide workflow detail behind a simple, discoverable entry point?
- Would splitting it reduce confusion, or would splitting create shallow fragments?

### Interface-First Delegation

- Does the artifact name what humans decide and what agents can execute?
- Are module boundaries, public interfaces, or expected artifacts explicit?
- Are high-risk areas kept under human review instead of handed off blindly?

### Token Efficiency

- Is the guidance short enough to stay useful when loaded into context?
- Does it point to source files instead of copying large background material?
- Is duplicated guidance removed or linked to one source of truth?

## Interpreting Results

- `10-12`: Healthy. Keep the artifact stable unless new evidence appears.
- `7-9`: Useful but worth tightening. Prefer one small edit.
- `4-6`: Risk of drift. Rework scope, language, or verification before reuse.
- `0-3`: Do not promote as durable guidance yet. Gather more examples first.

## Evidence To Capture

For each assessment, record:

- The workflow or artifact reviewed.
- The score by area.
- The concrete friction observed.
- The smallest recommended change.
- The verification performed.
- Whether a human accepted, deferred, or rejected the change.

Use `docs/learning-log.md` for accepted and deferred lessons.

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
