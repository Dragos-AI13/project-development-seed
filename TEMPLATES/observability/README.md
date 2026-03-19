# Observability Templates

This folder provides implementation templates for the seed's observability baseline (`docs/operations/OBSERVABILITY_STANDARD.md`).

Use these templates inside your generated project to ensure you have:
- Structured logs with correlation IDs (`X-Request-Id`).
- Core metrics (latency, error rate) and a scrape-compatible `/metrics` endpoint.
- Optional tracing via OpenTelemetry.

## Minimal Production Checklist
- `GET /health` (or `/healthz`) exists and returns success when the service is ready.
- `GET /metrics` exists and returns Prometheus-compatible output.
- Every request includes a correlation ID and it is propagated to logs.

## Templates Included
- `fastapi-observability-template.md`
- `node-observability-template.md`
- `otel-export-env-vars.md`

