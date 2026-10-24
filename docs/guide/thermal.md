---
layout: default
title: Thermal and reliability
parent: Builder guide
nav_order: 6
---

# Thermal and reliability

Cooling is a functional requirement. Before replacing or controlling the fan,
record its size, mounting pattern, connector, lead count, voltage, current,
airflow direction, control method, vibration path, and vent restrictions.

Measure idle and sustained closed-lid temperatures for the drives and Pi. Run
simultaneous read/write load, record SMART and CPU temperatures, ambient,
input current, fan state, and Pi 5 V voltage. Inspect for throttling, USB
resets, filesystem errors, fan stall, and hot connectors.

Set thresholds only from measured results and the selected drive data sheet.
The community cooling reference is anecdotal and contains a power claim that
conflicts with the manufacturer specification.
