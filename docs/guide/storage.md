---
layout: default
title: Storage and data
parent: Builder guide
nav_order: 4
---

# Storage and data

Each drive uses its own externally powered SATA-to-USB bridge. Both share the
Pi 3 USB 2.0 host, so performance must be measured on the final bridge and
drive combination. Use `/dev/disk/by-id/` or filesystem UUIDs, never transient
`/dev/sdX` names.

| Profile | Layout | Required warning |
|---|---|---|
| Separate disks | One ext4 filesystem per drive | No redundancy |
| RAID1 | mdadm mirror with ext4 above it | Mirror is not backup; setup erases both disks |

Record private drive identity and SMART baseline before destructive setup. A
bridge must demonstrate stable Linux operation, SMART passthrough, reset
recovery, and sufficient cable clearance. Validate reboot, replacement-drive
rebuild, controlled degraded operation, SMART alerts, and backup restore.
