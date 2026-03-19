param(
    [Parameter(Mandatory = $true)]
    [string]$DeployCommand,

    [string]$EnvironmentName = "production"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($DeployCommand)) {
    Write-Host "DEPLOY_COMMAND not set; skipping deploy step." -ForegroundColor Yellow
    exit 0
}

Write-Host ("Starting deploy for environment: {0}" -f $EnvironmentName) -ForegroundColor Cyan

# DeployCommand comes from a GitHub secret (fail-safe baseline).
# We intentionally do not print it to logs.
$null = Invoke-Expression $DeployCommand

Write-Host "Deploy command finished." -ForegroundColor Green
exit 0

