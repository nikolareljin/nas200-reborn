# nas200-reborn

Rebuild a Linksys NAS200 around a Raspberry Pi 3 Model B while retaining its
two stacked 3.5-inch drive bays.

![NAS200 Raspberry Pi placement illustration](docs/assets/images/nas200-pi-placement-concept.png)

The illustration shows the intended Pi location in the lid volume above the
upper drive. Confirm clearance, mounting points, and cable routing on the
enclosure before installation.

Start with the [builder guide](docs/guide/index.md): inspect the enclosure,
bench-test the power path, install the drives and Pi, configure storage, then
run the validation checklist.

## Build the documentation

```bash
./dev install
./dev test
./dev build docs
./dev preflight
```

`./dev install` initializes submodules, installs the Ruby documentation
dependencies, and configures local Git hooks. `./site` serves the built site
locally after installation.

## Build sequence

1. Read [hardware requirements](docs/hardware.md) and source the BOM.
2. Follow [power and wiring](docs/guide/power.md) before connecting the Pi or drives.
3. Complete [mechanical integration](docs/guide/mechanical.md) and [storage setup](docs/guide/storage.md).
4. Configure the operating system and services from [software setup](docs/guide/software.md).
5. Record the required checks in [validation](docs/guide/validation.md).

## Documentation

The GitHub Pages site publishes [the documentation index](docs/index.md).
