# Contributing Guide

Thanks for contributing to this seed.

## Branch and Commit Rules

- Use focused feature branches.
- Keep commits atomic and descriptive.
- Commit format: Conventional Commits, for example:
  - `feat(auth): add refresh token rotation`
  - `fix(api): validate pagination bounds`
  - `docs(seed): update adoption guide`

## Pull Request Rules

- Explain why the change is needed.
- Include test evidence and risk notes.
- Keep PR scope small and reviewable.

## Quality Gates

Before requesting review, ensure:

- Lint and formatting pass
- Relevant tests pass
- Security implications reviewed
- Documentation updated when needed

## Security and Secrets

- Never commit `.env`, credentials, or tokens.
- Report security concerns using `.github/SECURITY.md`.
