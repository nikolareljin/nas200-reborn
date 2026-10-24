# Contributing

Use primary sources or recorded measurements for wiring, power, thermal, and
compatibility claims. Remove serial numbers, MAC addresses, credentials,
network details, and disk contents from contributed evidence.

Start a contribution from an SSH clone:

```bash
git clone --recurse-submodules git@github.com:nikolareljin/nas200-reborn.git
cd nas200-reborn
./dev install
git switch -c docs/describe-change
./dev preflight
```

`./dev install` installs the local protected-ref hook. Direct pushes to `main`
must be refused.

Do not use `--no-verify`.

Run `./dev preflight` before opening a pull request. Include source links for
claims and the validation record for hardware changes.
