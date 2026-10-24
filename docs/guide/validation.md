---
layout: default
title: Validation
parent: Builder guide
nav_order: 8
---

# Validation

| Area | Test | Pass condition |
|---|---|---|
| Electrical | Input polarity and startup load | Correct protection and stable rails |
| Mechanical | Lid and drive service | No pinch; both carriers removable |
| USB | Both bridges under I/O | No reset, disconnect, or data error |
| Storage | Separate disks and RAID1 | Reboot, degrade, replacement, and rebuild work |
| SMART | Health and scheduled test | Both drives visible and alerts work |
| GPIO | Buttons and LEDs | One action per press; safe output polarity |
| Thermal | Closed-lid soak | No throttling, reset, error, or unsafe heat |
| Recovery | Boot media and bridge failure | Runbook restores access without changing data disks |

Keep raw command output, measurements, hardware revision, drive model, and
failures in private donor evidence. Do not publish a completed-builder claim
until every v1 row passes on one documented donor. Untested alternatives remain
proposed.
