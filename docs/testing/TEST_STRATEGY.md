# Test Strategy

Use this strategy to keep quality predictable from MVP to production.

## Test Layers

- Unit tests: pure logic, parsing, validation, policy checks
- Integration tests: module boundaries, API + DB flows
- End-to-end tests: critical user journeys only
- Security tests: auth boundaries, abuse inputs, rate limits

## Required by Change Type

- New feature: unit + integration
- Bug fix: regression test + impacted layer test
- Security-sensitive change: add explicit security-focused test
- Data migration: integrity and backward compatibility checks

## Reliability Rules

- Tests must be deterministic and isolated.
- No hidden dependency on external services unless explicitly integration-scoped.
- Flaky tests block merge until stabilized or quarantined with tracking issue.
