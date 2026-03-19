# Variant: FastAPI + PostgreSQL + Redis

## Choose When

- You need rapid MVP delivery.
- You prefer Python for business logic or AI integration.
- Async APIs and background jobs are core requirements.

## Avoid When

- Team/domain requires strict enterprise TypeScript conventions.
- Existing platform standards require Node runtime only.

## Trade-offs

- Pros: high delivery speed, rich Python ecosystem.
- Cons: async misuse can cause hidden reliability bugs.

## Baseline Stack

- FastAPI
- Pydantic validation
- PostgreSQL
- Redis (cache/queue)
- Pytest + Ruff
