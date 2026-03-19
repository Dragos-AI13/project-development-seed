# Blueprint: Fullstack SaaS

## Suggested Stack

- Web frontend + backend API + worker queue
- PostgreSQL, Redis, object storage

## Core Modules

- `auth`
- `billing`
- `tenancy`
- `projects`
- `notifications`

## Mandatory Gates

- Tenant isolation checks
- Billing-safe idempotent operations
- Audit logs for sensitive actions
