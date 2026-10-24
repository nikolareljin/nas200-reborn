# Contributing

Do not add a wiring, power, thermal, or compatibility claim without source or
measurement evidence. Keep raw donor evidence private until it is reviewed for
serial numbers, MAC addresses, network details, and disk contents.

After cloning, run `./dev install` before committing. It installs the local
protected-ref hook; direct pushes to `main` must be refused.

The local hook does not replace GitHub branch protection. Do not use
`--no-verify`; server-side branch protection is required before public release.

Run `./dev preflight` before opening a pull request.
