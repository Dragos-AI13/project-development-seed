param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$testHookPath = Join-Path $projectRoot "scripts\test.hook.ps1"

if (-not [string]::IsNullOrWhiteSpace($env:TEST_COMMAND)) {
    Write-Host "Running TEST_COMMAND..." -ForegroundColor Cyan
    Invoke-Expression $env:TEST_COMMAND
    exit 0
}

if (Test-Path -Path $testHookPath -PathType Leaf) {
    Write-Host "Running scripts/test.hook.ps1..." -ForegroundColor Cyan
    & $testHookPath
    exit 0
}

$packageJsonPath = Join-Path $projectRoot "package.json"
if (Test-Path -Path $packageJsonPath -PathType Leaf) {
    if (Test-Path -Path (Join-Path $projectRoot "pnpm-lock.yaml") -PathType Leaf) {
        Invoke-Expression "pnpm test -- --ci"
        exit 0
    }
    if (Test-Path -Path (Join-Path $projectRoot "yarn.lock") -PathType Leaf) {
        Invoke-Expression "yarn test -- --ci"
        exit 0
    }

    # npm fallback
    Invoke-Expression "npm test -- --ci"
    exit 0
}

if (Test-Path -Path (Join-Path $projectRoot "pyproject.toml") -PathType Leaf -or (Test-Path -Path (Join-Path $projectRoot "requirements.txt") -PathType Leaf)) {
    Invoke-Expression "pytest -q"
    exit 0
}

Write-Host "No known test runner found." -ForegroundColor Yellow
Write-Host "Set TEST_COMMAND, or provide scripts/test.hook.ps1, or add package.json/pytest setup." -ForegroundColor Yellow
exit 0

