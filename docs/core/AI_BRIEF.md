# AI BRIEF

Use this brief when an AI agent receives this repository as context.

## Agent Objective

Translate business intent into a working software project while following this seed's standards.

## Required Agent Flow

1. Read `docs/core/START_HERE.md`.
2. Read all files under `.cursor/rules/`.
3. Ask missing inputs from `docs/planning/DISCOVERY_QUESTIONS.md`.
4. Choose the nearest blueprint in `BLUEPRINTS/`.
5. Implement incrementally using `PLAYBOOKS/`.
6. Validate with `CHECKLISTS/` before finalizing.

## Agent Behavior Expectations

- Prefer simple and explicit solutions (KISS, YAGNI)
- Separate concerns and keep modules focused
- Validate and sanitize all external input
- Add tests for critical logic and edge cases
- Document architectural decisions (ADR format)

## Output Expectations

For each feature/task, the agent should produce:
- A short execution plan
- Code changes aligned with standards
- Test evidence
- Risk notes and follow-up actions
