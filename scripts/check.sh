#!/usr/bin/env bash
set -euo pipefail

required=(README.md LICENSE CONTRIBUTING.md SECURITY.md docs/index.md docs/hardware.md docs/software.md docs/references.md)
for path in "${required[@]}"; do
  [[ -s "$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done

bash -n dev build test site scripts/check.sh scripts/project.sh
for page in docs/*.md; do
  [[ "$(head -n 1 "$page")" == '---' ]] || {
    echo "missing Jekyll front matter: $page" >&2
    exit 1
  }
done
grep -qx 'remote_theme: just-the-docs/just-the-docs@v0.12.0' docs/_config.yml
grep -R -Eq 'proposed|Proposed' docs
grep -q 'Linksys NAS200' docs/hardware.md
grep -q 'NAS200-EU_V10_DS_C.pdf' docs/references.md
grep -q 'NAS200_V10_UG_B-WEB.pdf' docs/references.md
grep -q './dev install' README.md
grep -q 'protected-ref' CONTRIBUTING.md
echo "foundation checks passed"
