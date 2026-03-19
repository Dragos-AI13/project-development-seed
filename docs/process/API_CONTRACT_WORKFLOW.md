# API Contract Workflow

Use contract-first workflow for stable API delivery.

## Step 1: Define Contract

- Start with `TEMPLATES/api/openapi-starter.yaml`.
- Define paths, schemas, auth requirements, and error codes.

## Step 2: Review Contract

- Validate against `docs/standards/API_STANDARDS.md`.
- Validate security controls (authN/authZ, validation, rate limits).
- Register error codes in `TEMPLATES/api/error-codes-registry.md`.

## Step 3: Implement

- Implement handlers only after contract approval.
- Keep request/response parity with OpenAPI.

## Step 4: Contract Testing

- Add tests that assert response shapes and codes.
- Validate backward compatibility for existing consumers.

## Step 5: Release

- Update changelog and release notes.
- Communicate breaking/non-breaking API changes.
