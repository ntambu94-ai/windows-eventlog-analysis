# Incident Report: Windows Event Log Analysis

## Date of Investigation
March 26, 2026

## Investigator
Bemvindo Ntambu

## Objective
Analyze Windows Security Event Logs to detect brute-force login attempts.

---

## Summary
Detected failed login attempts against local account "TestUser" over a short time window, consistent with brute-force or password spraying behavior.

| Metric | Value |
|--------|-------|
| Total Failed Attempts | 47 |
| Most Targeted Username | TestUser |
| Source IP | N/A (local console) |
| Time Range | Within 90 seconds |

---

## Evidence

### 1. Test User Created
![Create Test User](screenshots/01-create-testuser.png)

### 2. Failed Login Attempts
![Failed Login Attempts](screenshots/02-failed-login-attempts.png)

### 3. Event Viewer – Event ID 4625
![Event ID 4625](screenshots/04-eventid-4625.png)

### 4. Export Success
![CSV Export](screenshots/09-export-success.png)

---

## Analysis
The following patterns were identified from the exported log data:

- Multiple failed login attempts using the TestUser account
- All attempts originated from local console (no remote IP)
- Failed attempts occurred within a short time window

---

## Recommendations

| Priority | Recommendation |
|----------|----------------|
| High | Enable account lockout after 5 failed attempts |
| High | Implement audit policy to capture source IP for all logon types |
| Medium | Configure SIEM to monitor Event ID 4625 |
| Low | Review and rotate passwords for privileged accounts |

---

## Files Created
| File | Location |
|------|----------|
| Extract-FailedLogins.ps1 | `/scripts/` |
| failed_logins_sample.csv | `/docs/` |
| Screenshots | `/screenshots/` |

---

## Status
✅ Lab Completed – March 26, 2026
