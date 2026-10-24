# nas200-reborn

Private preparation for a Raspberry Pi 3 Model B rebuild of the Linksys NAS200.

![Proposed NAS200 Raspberry Pi placement concept](docs/assets/images/nas200-pi-placement-concept.png)

Proposed placement concept: the Pi is shown in the lid volume above the upper
drive. This visualization is not a donor photograph or a measured fit. The
mechanical clearance, mounting points, and cable routing remain validation
gates before the layout becomes a supported build instruction.

The supported target preserves the NAS200 enclosure and its upper and lower
3.5-inch drive bays. Electrical, mechanical, and front-panel claims remain
proposed until they pass the donor evidence and validation procedures in
`docs/`.

## Development

```bash
./dev install
./dev test
./dev build docs
./dev preflight
```

Run `./dev install` immediately after every clone and before the first commit.
It initializes `script-helpers` and configures the local Git hooks, including
the protected-ref guard for `main`.

The repository is private while its builder guide, GitHub Pages content, and
hardware validation are prepared. Do not publish or expose an unfinished build
as a supported modification.

## Documentation

Start with [the documentation index](docs/index.md). It distinguishes
documented NAS200 facts from proposed wiring and measured donor evidence.
