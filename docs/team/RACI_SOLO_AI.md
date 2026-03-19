# RACI for Solo + AI

RACI maps responsibilities in a way that prevents "AI does everything" or "AI guesses".

Legend:
- **R** = Responsible (performs the work)
- **A** = Accountable (owns the final decision / approval)
- **C** = Consulted (informs decisions)
- **I** = Informed (notified, no decision power)

## Roles

- **You** = Product owner and final approver (**A**)
- **AI + Cursor** = Executor (**R**) plus reviewer assistant (**C**)

## Matrix (high level)

- Product definition
  - You: **A**
  - AI: **R** (drafts MVP/backlog) + **C** (proposes options)

- Architecture decisions (ADR)
  - AI: **R** (drafts ADRs and boundary proposals)
  - You: **A** (accepts or requires changes)

- Implementation
  - AI: **R**
  - You: **A** (approves final changes per task)

- Testing and quality evidence
  - AI: **R** (adds/updates tests)
  - You: **A** (verifies gates and approves)

- Security controls
  - AI: **R** (implements controls and writes notes)
  - You: **A** (approves exceptions and confirms no sensitive leakage)

- Release and operational readiness
  - AI: **R** (updates CI, release docs, runbooks)
  - You: **A** (approves go/no-go)
