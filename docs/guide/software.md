---
layout: default
title: Software
parent: Builder guide
nav_order: 5
---

# Software

The intended stack is 64-bit Raspberry Pi OS Lite, OpenMediaVault, Samba,
smartmontools, and a local systemd-managed GPIO service. Pin the operating
system image checksum, package sources, OpenMediaVault major version, and
configuration revisions. Do not pipe an unreviewed remote script into a
privileged shell.

First boot: write a verified image, create a non-root administrator and SSH
key access, verify network recovery, install the reviewed pinned management
stack, then configure filesystems, shares, SMART, alerts, and accounts.

The future GPIO service owns only the selected lines, debounces inputs, writes
journal events, initializes outputs inactive, and offers a LED-only test mode
that cannot shut down or reboot the system.

Use individual Samba accounts, key-based SSH after recovery is proven, LAN-only
administration, a documented update rollback path, and separate backups of
configuration and user data.
