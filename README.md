# Windows Event Log Analysis

## Overview
Security analysis lab detecting brute-force login attempts through Windows Event Log investigation.

## Lab Objectives
- Create test user account
- Simulate failed login attempts
- Extract Event ID 4625 logs using PowerShell
- Analyze patterns and create incident report

## Repository Structure
```text
windows-eventlog-analysis/
├── README.md
├── screenshots/
│   ├── 01-create-testuser.png.png
│   ├── 02-failed-login-attempts.png.png
│   ├── 03-event-viewer.png.png
│   ├── 04-eventid-4625.png.png
│   ├── 05-export-error.png.png
│   ├── 06-create-temp-folder.png.png
│   ├── 07-csv-not-found.png.png
│   ├── 08-test-path-false.png.png
│   ├── 09-export-success.png.png
│   └── 10-export-command.png.png
└── scripts/
    ├── Extract-FailedLogins.ps1
    └── incident-report.md
```

## Tools Used
- Windows Event Viewer
- PowerShell
- Command Prompt

## Key Findings
- Detected multiple failed login attempts (Event ID 4625)
- Pattern consistent with brute-force behavior
- Successfully exported and documented findings

## How to Run This Lab
> Use these steps only in an authorized Windows test environment. Run PowerShell as Administrator.

1. Create the temporary lab account:

   ```powershell
   $Password = Read-Host "Enter a temporary password for TestUser" -AsSecureString
   New-LocalUser -Name "TestUser" -Password $Password -FullName "Test User" -Description "Test account for log analysis"
   ```

2. Open Command Prompt and generate failed-login events:

   ```cmd
   runas /user:TestUser cmd.exe
   ```

   Enter an incorrect password. Repeat the command several times to generate multiple Event ID 4625 records.

3. Open Event Viewer and verify the events under:

   ```text
   Windows Logs → Security → Event ID 4625
   ```

4. From the repository’s root folder, run the extraction script in Administrator PowerShell:

   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File ".\scripts\Extract-FailedLogins.ps1"
   ```

5. Confirm that the output file was created:

   ```powershell
   Test-Path "C:\temp\failed_logins.csv"
   ```

   A result of `True` confirms that the CSV exists.

6. Review the [incident report](scripts/incident-report.md) for the findings, evidence, and recommendations.

## Status
✅ Completed – March 2026

## Author
Bemvindo Ntambu – IT Support & Cybersecurity Professional
