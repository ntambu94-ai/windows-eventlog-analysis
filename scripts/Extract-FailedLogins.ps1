# Extract failed Windows login events (Event ID 4625)
# Run PowerShell as Administrator.

$OutputDirectory = "C:\Temp"
$OutputFile = Join-Path $OutputDirectory "FailedLogins.csv"

if (-not (Test-Path $OutputDirectory)) {
    New-Item -Path $OutputDirectory -ItemType Directory -Force | Out-Null
}

$FailedLogins = Get-WinEvent -FilterHashtable @{
    LogName = "Security"
    Id      = 4625
} -ErrorAction Stop

$FailedLogins |
    Select-Object TimeCreated, Id, MachineName, ProviderName, Message |
    Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8

Write-Host "Export complete." -ForegroundColor Green
Write-Host "Events exported: $($FailedLogins.Count)"
Write-Host "Output file: $OutputFile"
