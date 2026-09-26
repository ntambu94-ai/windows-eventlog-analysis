$OutputDirectory = "C:\temp"
$OutputFile = Join-Path $OutputDirectory "failed_logins.csv"

if (-not (Test-Path $OutputDirectory)) {
    New-Item -Path $OutputDirectory -ItemType Directory -Force | Out-Null
}

$FailedLogins = Get-WinEvent -FilterHashtable @{
    LogName   = "Security"
    Id        = 4625
    StartTime = (Get-Date).AddHours(-24)
} -ErrorAction Stop

$FailedLogins |
    Select-Object TimeCreated, Id, Message |
    Export-Csv -Path $OutputFile -NoTypeInformation

Write-Host "Export complete." -ForegroundColor Green
Write-Host "Events exported: $($FailedLogins.Count)"
Write-Host "Output file: $OutputFile"
