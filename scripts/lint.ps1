param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$lintHookPath = Join-Path $projectRoot "scripts\lint.hook.ps1"

if (-not [string]::IsNullOrWhiteSpace($env:LINT_COMMAND)) {
    Write-Host "Running LINT_COMMAND..." -ForegroundColor Cyan
    Invoke-Expression $env:LINT_COMMAND
    exit 0
}

if (Test-Path -Path $lintHookPath -PathType Leaf) {
    Write-Host "Running scripts/lint.hook.ps1..." -ForegroundColor Cyan
    & $lintHookPath
    exit 0
}

$packageJsonPath = Join-Path $projectRoot "package.json"
if (Test-Path -Path $packageJsonPath -PathType Leaf) {
    # Try common lint commands. Keep it forgiving for projects without a lint script.
    if (Test-Path -Path (Join-Path $projectRoot "pnpm-lock.yaml") -PathType Leaf) {
        Invoke-Expression "pnpm lint"
        exit 0
    }
    if (Test-Path -Path (Join-Path $projectRoot "yarn.lock") -PathType Leaf) {
        Invoke-Expression "yarn lint"
        exit 0
    }

    # npm fallback
    Invoke-Expression "npm run lint"
    exit 0
}

if (Test-Path -Path (Join-Path $projectRoot "pyproject.toml") -PathType Leaf -or (Test-Path -Path (Join-Path $projectRoot "requirements.txt") -PathType Leaf)) {
    # Ruff is the default baseline linter for this seed.
    Invoke-Expression "python -m ruff check ."
    exit 0
}

Write-Host "No known lint runner found." -ForegroundColor Yellow
Write-Host "Set LINT_COMMAND, or provide scripts/lint.hook.ps1, or add package.json/pyproject.toml." -ForegroundColor Yellow
exit 0

