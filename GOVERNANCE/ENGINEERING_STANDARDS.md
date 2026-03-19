# Engineering Standards

## Code

- Single responsibility per module and function.
- Explicit naming; avoid ambiguous abbreviations.
- No silent exception swallowing.
- Keep functions small and composable.

## Security

- Security controls are mandatory, not optional enhancements.
- Input validation is required at service boundaries.
- Sensitive operations require auth + authorization checks.

## Quality

- Lint and formatting must pass in CI.
- Unit and integration tests required for critical paths.
- New behavior requires updated documentation.
