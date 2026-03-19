param(
    [string]$HealthUrl = "",
    [string]$MetricsUrl = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-Endpoint {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Url,

        [string]$Name
    )

    if ([string]::IsNullOrWhiteSpace($Url)) {
        return
    }

    try {
        $resp = Invoke-WebRequest -UseBasicParsing -Uri $Url -Method GET -TimeoutSec 15
        Write-Host ("Smoke test OK: {0} -> HTTP {1}" -f $Name, $resp.StatusCode) -ForegroundColor Green
    }
    catch {
        throw ("Smoke test FAILED: {0} ({1}) - {2}" -f $Name, $Url, $_.Exception.Message)
    }
}

Test-Endpoint -Url $HealthUrl -Name "health"
Test-Endpoint -Url $MetricsUrl -Name "metrics"

Write-Host "Smoke tests completed." -ForegroundColor Green
exit 0

