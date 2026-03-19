# Tech Decision Matrix

Score options before selecting stack. Use 1 (poor) to 5 (excellent).

## Weighted Criteria

| Criterion | Weight | Notes |
|---|---:|---|
| Time to market | 20 | Delivery speed for MVP and first release |
| Security fit | 20 | Built-in controls and hardening capability |
| Maintainability | 15 | Modularity, readability, long-term ownership |
| Cost efficiency | 10 | Infra + dev velocity + operational cost |
| Ecosystem/tooling | 10 | Libraries, docs, debugging support |
| Solo dev fit | 15 | Cognitive load and implementation complexity |
| Scalability path | 10 | Safe growth path from MVP to production |

## Scoring Template

| Option | Time | Security | Maintainability | Cost | Ecosystem | Solo fit | Scalability | Weighted Total |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Option A | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Option B | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

Formula:
- Weighted Total = sum(score x weight)

## Decision Rules

- Pick highest weighted total unless blocked by hard constraints.
- Document final rationale in ADR.
- Re-run matrix only when major constraints change.
