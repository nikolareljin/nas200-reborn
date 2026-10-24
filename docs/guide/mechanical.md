---
layout: default
title: Mechanical integration
parent: Builder guide
nav_order: 2
---

# Mechanical integration

Mount the Raspberry Pi 3 Model B in the lid volume only after donor measurements
prove it cannot contact the upper drive, lid, cable, or chassis. Use an
insulating bracket, machine screws, and standoffs. A conductive lid must never
touch the Pi underside, GPIO pins, USB shells, or exposed solder joints.

| Gate | Pass condition |
|---|---|
| Clearance | Lid closes with allowance for thermal expansion |
| Drive service | Both carriers remain removable without disturbing the Pi |
| Cable bend | SATA-USB, Ethernet, and power leads meet bend radius requirements |
| Air path | Bracket and cables do not obstruct vents or fan exhaust |
| Strain relief | No connector bears harness weight or drive-door movement |

Use a short internal Ethernet lead to a panel-mount coupler or a measured rear
opening. Reuse an existing opening when possible. An external USB extension is
optional and must not share a weak unpowered hub with both internal drives.

Any printable mount must include measured NAS200 attachment coordinates,
keepouts, Pi hole spacing, standoff height, airflow openings, enclosure
revision, and measurement date.
