# Software baseline

The intended stack is 64-bit Raspberry Pi OS Lite, OpenMediaVault, Samba,
smartmontools, and a local GPIO service. Separate ext4 disks and mdadm RAID1
will both be documented after hardware validation.

Do not use an unreviewed remote installer pipeline. Pin the operating-system
image checksum, OpenMediaVault release, and configuration revisions.
