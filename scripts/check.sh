#!/usr/bin/env bash
set -euo pipefail

required=(
  README.md
  CHANGELOG.md
  Gemfile
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
grep -q 'Linksys NAS200' docs/hardware.md
grep -q 'NAS200-EU_V10_DS_C.pdf' docs/references.md
grep -q 'NAS200_V10_UG_B-WEB.pdf' docs/references.md
grep -q './dev install' README.md
grep -q 'nas200-pi-placement-concept.png' README.md
grep -q 'protected-ref' CONTRIBUTING.md
grep -q 'bundle exec jekyll build' scripts/project.sh
grep -q 'Deploy Pages' .github/workflows/pages.yml
internal_name='key'"stone"
for legacy in 'repository is private' 'before public release' "$internal_name" 'do not publish' 'private donor evidence'; do
  if grep -R -n -i -F "$legacy" -- README.md CONTRIBUTING.md SECURITY.md docs; then
    echo "legacy project-state wording: $legacy" >&2
    exit 1
  fi
done
for diagram in docs/guide/diagrams/*.svg; do
  grep -q '<title ' "$diagram"
  grep -q '<desc ' "$diagram"
  case "$(basename "$diagram")" in
    validation-flow.svg) grep -q 'Status: documented process' "$diagram" ;;
    *) grep -q 'Status:' "$diagram" ;;
  esac
done
echo "foundation checks passed"
