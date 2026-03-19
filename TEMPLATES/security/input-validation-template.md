# Input Validation Template

Goal: reject unsafe input early with stable error payloads.

## Rules
- Validate request body, query params, and path params.
- Sanitize user-provided strings before further processing.
- Escape/sanitize untrusted output if it is rendered anywhere.
- Use a single validation error shape across endpoints.

## Validation Error Payload
Return structured error response with:
- HTTP 400
- `code=VALIDATION_ERROR`
- `message="Input validation failed"`
- `request_id`
- `details` containing field-level error info (field path, reason)

## Implementation Notes
- Prefer framework-native schemas (Zod, Pydantic, class-validator, etc.).
- Ensure errors do not leak secrets (never echo raw headers/tokens).

