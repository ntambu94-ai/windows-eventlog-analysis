# windows-eventlog-analysis
Windows Security Event Log analysis for brute-force detection and incident investigation



## Objective
Analyze Windows Security Event Logs to detect brute-force login attempts and unauthorized access patterns as part of security incident investigation practice.

## Tools Used
- Windows Event Viewer
- PowerShell
- AlienVault OSSIM (for correlation)

## Process
1. Exported Security logs from Windows Server 2019
2. Filtered for Event ID 4625 (failed logins)
3. Identified multiple failures from same source IP within 2 minutes
4. Created PowerShell script to automate extraction of failed login attempts

## Key Findings
- 47 failed login attempts from 192.168.1.105 within 90 seconds
- Account "Administrator" targeted repeatedly
- No successful logins from that IP after 3rd attempt

## Recommendations
- Implement account lockout after 5 failed attempts
- Enable source IP blocking via firewall
- Monitor for similar patterns using SIEM correlation rules

## Files
- `/scripts/Extract-FailedLogins.ps1` – PowerShell script used
- `/docs/incident-report-template.md` – Investigation template

## Status
✅ Completed 
