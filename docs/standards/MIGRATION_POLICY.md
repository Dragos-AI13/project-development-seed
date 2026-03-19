# Migration Policy

Use this policy for safe, repeatable database changes.

## Rules

- Every schema change must have a migration artifact.
- Migrations must be deterministic and reviewed.
- Prefer forward-safe and rollback-aware change strategy.
- Destructive operations require backup validation.

## Zero-Downtime Guidance

- Split risky changes into phases (expand, migrate, contract).
- Avoid lock-heavy operations during peak traffic.
- Add new columns as nullable first, then backfill, then enforce constraints.

## Verification Checklist

- Migration tested on a production-like snapshot.
- Rollback path documented.
- Monitoring checks identified for post-deploy validation.
- Data integrity checks defined.
