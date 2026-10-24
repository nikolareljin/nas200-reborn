#!/usr/bin/env bash
set -euo pipefail

required=(README.md LICENSE CONTRIBUTING.md SECURITY.md docs/index.md docs/hardware.md docs/software.md docs/references.md)
for path in "${required[@]}"; do
  [[ -s "$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done

bash -n dev build test site scripts/check.sh scripts/project.sh
grep -R -Eq 'proposed|Proposed' docs
grep -q 'Linksys NAS200' docs/hardware.md
echo "foundation checks passed"
