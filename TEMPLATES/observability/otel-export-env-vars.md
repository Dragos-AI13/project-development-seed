# OpenTelemetry Export (Safe Environment Variables)

Use these environment variables as a safe baseline. Do not hardcode secrets.

## OTLP Export
- `OTEL_EXPORTER_OTLP_ENDPOINT`
  - Example: `http://otel-collector:4317` (or `:4318` depending on your collector)

- `OTEL_SERVICE_NAME`
  - Example: `my-service`

## Correlation & Logs (Correlation ID)
- Adopt `X-Request-Id` in your app and propagate it across:
  - incoming requests
  - logs
  - trace context (when tracing is enabled)

## Sampling (optional)
- If you need to reduce cost, set a sampling rate in your OpenTelemetry SDK configuration.

