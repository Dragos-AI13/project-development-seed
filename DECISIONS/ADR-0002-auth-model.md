# ADR-0002: Authentication and Authorization Model

## Status

Accepted

## Context

Projects require secure access control with scalable, auditable policies.

## Decision

Use token-based authentication and server-side authorization checks (RBAC baseline).

## Consequences

- Consistent access control
- Easy enforcement in APIs
- Requires policy maintenance as domain grows
