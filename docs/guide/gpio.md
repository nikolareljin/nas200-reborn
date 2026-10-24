---
layout: default
title: Front panel and GPIO
parent: Builder guide
nav_order: 3
---

# Front panel and GPIO

GPIO numbers below are BCM numbers, not physical header pin numbers.

| Function | BCM GPIO | Physical pin | Interface | Behavior |
|---|---:|---:|---|---|
| Orderly shutdown | 26 | 37 | Button to ground, internal pull-up | Debounced press requests shutdown |
| Controlled reboot | 19 | 35 | Button to ground, internal pull-up | Debounced hold requests reboot |
| Power status | 20 | 38 | Transistor LED driver | On while service is healthy |
| Disk activity | 21 | 40 | Transistor LED driver | Pulse from monitored I/O |
| Optional fan PWM | 18 | 12 | Approved controller | Temperature policy controls speed |

Buttons connect only between the assigned input and ground. Never connect an
LED or fan motor directly to a Pi GPIO. Use a transistor or MOSFET driver with
the required resistor, defined inactive state, and current limit.

The original panel PCB is unverified. Photograph the connector, map buttons by
continuity, establish LED polarity in diode mode, identify shared circuitry,
and only then power it through a current-limited supply. Do not use GPIO14 or
GPIO15 for this v1 panel interface; they create UART and boot ambiguity.
