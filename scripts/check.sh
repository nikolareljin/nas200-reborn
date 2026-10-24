#!/usr/bin/env bash
set -euo pipefail

required=(
  README.md
  LICENSE
  CONTRIBUTING.md
  SECURITY.md
  docs/index.md
  docs/hardware.md
  docs/software.md
  docs/references.md
  docs/assets/images/nas200-pi-placement-concept.png
  docs/guide/index.md
  docs/guide/power.md
  docs/guide/mechanical.md
  docs/guide/gpio.md
  docs/guide/storage.md
  docs/guide/software.md
  docs/guide/thermal.md
  docs/guide/bom.md
  docs/guide/validation.md
  docs/guide/artifacts.md
  docs/guide/diagrams/power-tree.svg
  docs/guide/diagrams/data-topology.svg
  docs/guide/diagrams/gpio-interface.svg
  docs/guide/diagrams/validation-flow.svg
  docs/fixtures/evidence-record.template.md
)
for path in "${required[@]}"; do
  [[ -s "$path" ]] || { echo "missing required file: $path" >&2; exit 1; }
done

bash -n dev build test site scripts/check.sh scripts/project.sh
shopt -s globstar nullglob
for page in docs/**/*.md; do
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
grep -q 'nas200-pi-placement-concept.png' README.md
grep -q 'protected-ref' CONTRIBUTING.md
for diagram in docs/guide/diagrams/*.svg; do
  grep -q '<title ' "$diagram"
  grep -q '<desc ' "$diagram"
  case "$(basename "$diagram")" in
    validation-flow.svg) grep -q 'Status: documented process' "$diagram" ;;
    *) grep -q 'Status: proposed' "$diagram" ;;
  esac
done
echo "foundation checks passed"
