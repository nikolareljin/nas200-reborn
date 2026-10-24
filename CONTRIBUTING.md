# Contributing

Use primary sources or recorded measurements for wiring, power, thermal, and
compatibility claims. Remove serial numbers, MAC addresses, credentials,
network details, and disk contents from contributed evidence.

After cloning, run `./dev install` before committing. It installs the local
protected-ref hook; direct pushes to `main` must be refused.

Do not use `--no-verify`.

Run `./dev preflight` before opening a pull request.
