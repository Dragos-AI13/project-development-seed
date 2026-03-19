# Minimum Test Set

For each feature class, ensure these tests exist before release.

## Authentication and Authorization

- Unauthenticated request denied
- Unauthorized role denied
- Authorized role allowed
- Token/session expiry behavior validated

## Data Write Flows

- Validation failures return stable error shape
- Duplicate/idempotent request handling
- Transaction rollback on failure

## Async Jobs

- Retry behavior verified
- Timeout behavior verified
- Failure status propagation verified

## Public API

- Contract shape test (request/response schema)
- Error code mapping test
- Pagination and limits test where applicable
