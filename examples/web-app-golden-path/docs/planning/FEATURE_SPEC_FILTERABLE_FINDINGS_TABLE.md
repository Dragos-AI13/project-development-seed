# Feature Spec: Filterable Findings Table

## Context

- Problem: users cannot quickly triage findings by severity/status.
- User impact: faster investigation workflow.
- Expected value: reduced time-to-triage.

## Scope

- In scope: filter by severity/status, persisted filter state in URL.
- Out of scope: saved custom filter presets.

## Security Notes

- Client-side validation for filter inputs.
- Server-side authorization remains source of truth.

## Testing Plan

- Unit: filter state reducer.
- Integration: table rendering with combined filters.
- E2E: URL persistence across reload.
