# Data Modeling Guide

Use this guide for production-safe schema design.

## Core Principles

- Model by domain boundaries, not by UI screens.
- Prefer explicit relations and constraints.
- Encode invariants in schema (unique, check, foreign keys).
- Keep naming consistent and predictable.

## Table Design

- Add primary keys and timestamps by default.
- Use immutable IDs exposed externally when possible.
- Add indexes for frequent query paths.
- Avoid nullable columns for required domain state.

## Performance and Query Safety

- Design to avoid N+1 patterns.
- Validate index usage on critical queries.
- Use pagination for list endpoints by default.

## Multi-tenant and Security Considerations

- Include tenant/project ownership fields where needed.
- Enforce tenant boundaries in data access layer.
- Never store secrets in plain text.
