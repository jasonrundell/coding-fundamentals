# Concepts

This pack is based on the idea that AI-assisted development raises the value of software fundamentals.

## Code Is Not Cheap

AI can produce code quickly, but bad code becomes more expensive when change speed increases. If every change ignores the design of the whole system, the codebase drifts toward entropy.

Good codebases are easy to understand, test, and change. That makes agents more useful because they can navigate the project, make smaller edits, and get meaningful feedback.

## Design Concept

A design concept is the shared idea of what is being built. It is not the same as a PRD, issue, or plan. Those artifacts should come after enough conversation to expose assumptions, constraints, and dependent decisions.

Use the `grill-me` workflow when the request is ambiguous or strategically important.

## Ubiquitous Language

Ubiquitous language means the same domain terms appear in conversations, code, documentation, tests, and prompts.

Agents benefit from this because they can reason with fewer translations and less vague context.

## Feedback Loops

Feedback rate is the speed limit. Types, tests, linting, builds, runtime logs, and browser inspection are all feedback loops.

AI agents tend to make large edits before checking feedback. The antidote is small verified steps: write or update a test, make it pass, refactor, and repeat.

## Deep Modules

Deep modules hide meaningful behavior behind simple interfaces. Shallow modules expose too many small pieces, forcing both humans and agents to chase dependencies through the codebase.

Deep modules improve comprehension, testing, and delegation.

## Interface-First Delegation

Humans should own strategic design decisions: module boundaries, public interfaces, risk, and verification. Agents can do more implementation work safely when interfaces and tests are clear.

For non-trivial work, plans should name the affected modules and interface changes, not only user stories.

## Token Efficiency

Token efficiency is context engineering, not just shorter prompts.

Keep the model’s attention on design concept, domain language, module boundaries, tests, and interface decisions. Prefer targeted reads and `@file` references over pasted bulk content.
