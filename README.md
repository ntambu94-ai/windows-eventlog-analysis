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
1. Run `New-LocalUser` to create test account
2. Simulate failed logins with `runas /user:TestUser cmd.exe`
3. Export logs using PowerShell script in `/scripts/`
4. Review incident report for analysis

## Status
✅ Completed – March 2026

## Author
Bemvindo Ntambu – IT Support & Cybersecurity Professional
