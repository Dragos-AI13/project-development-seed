param(
    [string]$Environment = "development",
    [int]$Port = 8000,
    [string]$ComposeFile = "docker-compose.yml",
    # For Python/uvicorn projects: set UVICORN_APP (e.g. "app.main:app") to enable auto-run.
    [string]$UvicornApp = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

#
# Note: this script is framework-agnostic.
# It uses:
# - DEV_COMMAND (env override)
# - optional project hook: scripts/dev.hook.ps1
# - best-effort detection (docker-compose/package.json/pyproject)
# If nothing is found, it prints guidance and exits 0 (does not block).
#
$projectRoot = Split-Path -Parent $PSScriptRoot
$devHookPath = Join-Path $projectRoot "scripts\dev.hook.ps1"

function Invoke-CommandOrThrow {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,
        [Parameter(Mandatory = $true)]
        [string]$HumanName
    )

    if ([string]::IsNullOrWhiteSpace($Command)) {
        throw "$HumanName command is empty."
    }

    Write-Host ("Running {0}..." -f $HumanName) -ForegroundColor Cyan
    Invoke-Expression $Command
}

# Contract: the user/project can override defaults with env vars.
# These are NOT secrets by design; keep secrets in real .env files/secret stores.
$envDevCommand = $env:DEV_COMMAND
if (-not [string]::IsNullOrWhiteSpace($envDevCommand)) {
    Invoke-CommandOrThrow -Command $envDevCommand -HumanName "DEV_COMMAND"
    exit 0
}

if (Test-Path -Path $devHookPath -PathType Leaf) {
    Write-Host "Running scripts/dev.hook.ps1..." -ForegroundColor Cyan
    & $devHookPath
    exit 0
}

function Join-ProjectPath {
    param([Parameter(Mandatory = $true)][string]$RelativePath)
    return (Join-Path $projectRoot $RelativePath)
}

$composePath = Join-ProjectPath $ComposeFile
if (Test-Path -Path $composePath -PathType Leaf) {
    Invoke-CommandOrThrow -Command ("docker compose -f `"{0}`" up --build" -f $ComposeFile) -HumanName "docker compose"
    exit 0
}

$packageJsonPath = Join-ProjectPath "package.json"
if (Test-Path -Path $packageJsonPath -PathType Leaf) {
    # Prefer the package manager detected by lockfiles.
    if (Test-Path -Path (Join-ProjectPath "pnpm-lock.yaml") -PathType Leaf) {
        Invoke-CommandOrThrow -Command "pnpm dev" -HumanName "pnpm dev"
        exit 0
    }
    if (Test-Path -Path (Join-ProjectPath "yarn.lock") -PathType Leaf) {
        Invoke-CommandOrThrow -Command "yarn dev" -HumanName "yarn dev"
        exit 0
    }

    Invoke-CommandOrThrow -Command "npm run dev" -HumanName "npm run dev"
    exit 0
}

if (Test-Path -Path (Join-ProjectPath "pyproject.toml") -PathType Leaf -or (Test-Path -Path (Join-ProjectPath "requirements.txt") -PathType Leaf)) {
    $app = $UvicornApp
    if ([string]::IsNullOrWhiteSpace($app)) {
        $app = $env:UVICORN_APP
    }

    if ([string]::IsNullOrWhiteSpace($app)) {
        Write-Host "Python detected, but UVICORN_APP is not set." -ForegroundColor Yellow
        Write-Host "Set UVICORN_APP (e.g. 'app.main:app') or use DEV_COMMAND/scripts/dev.hook.ps1." -ForegroundColor Yellow
        exit 0
    }

    $bindHost = "0.0.0.0"
    Invoke-CommandOrThrow -Command ("uvicorn `"$app`" --host `"$bindHost`" --port {0} --reload" -f $Port) -HumanName "uvicorn --reload"
    exit 0
}

Write-Host "No known dev runner found." -ForegroundColor Yellow
Write-Host "Set DEV_COMMAND, or add scripts/dev.hook.ps1, or provide docker-compose.yml / package.json / pyproject.toml." -ForegroundColor Yellow
exit 0

