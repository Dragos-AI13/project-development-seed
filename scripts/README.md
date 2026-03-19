# Scripts

## init-project.ps1

Interactive bootstrap script that copies a chosen blueprint skeleton into an empty target folder.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1
```

Or non-interactive:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\init-project.ps1 -ProjectType backend-api -TargetPath C:\work\my-api
```

## validate-seed.ps1

Validates critical seed files and key README references.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate-seed.ps1
```

## check-pre-release.ps1

Validates the minimum `CHECKLISTS/pre-release.md` requirements for release readiness.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-pre-release.ps1
```

## deploy.ps1

Executes a secret-gated deployment command (`DEPLOY_COMMAND`) provided via GitHub Actions secrets.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\deploy.ps1 -DeployCommand $env:DEPLOY_COMMAND -EnvironmentName production
```

## smoke-test.ps1

Performs optional smoke checks for `health` and `metrics` endpoints.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\smoke-test.ps1 -HealthUrl $env:SMOKE_HEALTH_URL -MetricsUrl $env:SMOKE_METRICS_URL
```

## dev.ps1

Local dev runner. Tries, in order:
- `DEV_COMMAND` override
- `scripts/dev.hook.ps1` (optional project hook)
- `docker-compose.yml`
- `package.json` (dev scripts)
- Python/uvicorn (requires `UVICORN_APP`)

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -Environment development -Port 8000
```

## lint.ps1

Local lint runner. Uses `LINT_COMMAND` override or attempts `pnpm/yarn/npm lint` and/or `ruff`.

It also supports `scripts/lint.hook.ps1` as an optional framework-specific hook.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\lint.ps1
```

## test.ps1

Local test runner. Uses `TEST_COMMAND` override or attempts `pnpm/yarn/npm test` and/or `pytest`.

It also supports `scripts/test.hook.ps1` as an optional framework-specific hook.

### Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\test.ps1
```
