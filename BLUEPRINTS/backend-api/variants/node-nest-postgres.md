# Variant: NestJS + PostgreSQL + Redis

## Choose When

- You need strict module boundaries and DI conventions.
- TypeScript-first backend is preferred.
- Long-lived API platform is expected.

## Avoid When

- Delivery speed and low boilerplate are top priority.
- You do not want framework-heavy patterns.

## Trade-offs

- Pros: strong structure, scalable architecture patterns.
- Cons: slower startup and more boilerplate for MVP.

## Baseline Stack

- NestJS
- Zod/class-validator
- PostgreSQL
- Redis
- Jest + ESLint
