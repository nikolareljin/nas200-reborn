---
layout: default
title: Hardware baseline
nav_order: 2
---

# Hardware baseline

The Linksys NAS200 has [two 3.5-inch SATA bays][datasheet] arranged as upper
and lower bays in the [user guide][user-guide]. Its documented input is 12 V DC
at 5 A.[datasheet] SATA drives require both 12 V and regulated 5 V rails; do
not wire a drive or Raspberry Pi directly to 12 V.

Build with a Raspberry Pi 3 Model B, two externally powered SATA-to-USB
bridges, fused 12 V distribution, a 5 V buck converter, and an insulated
mount. Measure the panel, backplane, fan, and lid clearance before reuse.

[datasheet]: https://downloads.linksys.com/downloads/datasheet/NAS200-EU_V10_DS_C.pdf
[user-guide]: https://downloads.linksys.com/downloads/userguide/1224638534997/NAS200_V10_UG_B-WEB.pdf
