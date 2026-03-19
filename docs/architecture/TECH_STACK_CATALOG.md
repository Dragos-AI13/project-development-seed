# Tech Stack Catalog

Use this catalog to shortlist technologies before scoring them in `TECH_DECISION_MATRIX.md`.

## Backend API

- FastAPI + PostgreSQL + Redis
  - Best for: speed, Python ecosystem, AI-heavy workflows
  - Risks: async discipline needed, typing consistency
- NestJS + PostgreSQL + Redis
  - Best for: strict architecture, large modular codebases
  - Risks: higher boilerplate, steeper initial setup

## Web Frontend

- Next.js + TypeScript + Tailwind
  - Best for: fullstack web delivery and SEO-sensitive products
  - Risks: SSR complexity, bundle discipline required
- React + Vite + TypeScript
  - Best for: SPA speed and simple deployment
  - Risks: more manual decisions for routing/data conventions

## Mobile

- Flutter
  - Best for: one codebase, strong UI consistency
  - Risks: Dart adoption and ecosystem fit
- React Native
  - Best for: JS/TS teams and web skill reuse
  - Risks: native edge cases and dependency fragmentation

## Desktop

- Tauri
  - Best for: lightweight desktop apps, lower memory footprint
  - Risks: Rust/tooling learning curve
- Electron
  - Best for: fastest delivery with web stack reuse
  - Risks: runtime memory footprint

## Infrastructure and Operations

- Docker + Compose for local dev baseline
- GitHub Actions for CI/CD baseline
- PostgreSQL for transactional core data
- Redis for cache/queue transient state

## Security and Compliance

- JWT or session-based auth depending on product model
- Secrets via environment manager, never in repository
- Dependency auditing and security workflows enabled by default
