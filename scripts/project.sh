#!/usr/bin/env bash

project_test() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}

project_bundle() {
  local user_bundle

  if command -v bundle >/dev/null 2>&1; then
    bundle "$@"
    return
  fi

  if command -v ruby >/dev/null 2>&1; then
    user_bundle="$(ruby -r rubygems -e 'print File.join(Gem.user_dir, "bin", "bundle")')"
    if [[ -x "$user_bundle" ]]; then
      "$user_bundle" "$@"
      return
    fi
  fi

  printf '%s\n' 'Bundler is required. Run ./dev install.' >&2
  return 127
}

project_install() {
  git submodule update --init --recursive
  dev_install_hooks
  if ! project_bundle --version >/dev/null 2>&1; then
    gem install --user-install --no-document bundler -v 4.0.23
  fi
  project_bundle config set path vendor/bundle
  project_bundle install
}

project_build() {
  case "${DEV_TARGET:-docs}" in
    ""|docs)
      bash "$DEV_REPO_ROOT/scripts/check.sh"
      project_bundle exec jekyll build --source "$DEV_REPO_ROOT/docs" --destination "$DEV_REPO_ROOT/_site"
      ;;
    *) not_applicable build "only documentation checks exist in the foundation release" ;;
  esac
}

project_preflight() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}

project_site() {
  project_bundle exec jekyll serve --source "$DEV_REPO_ROOT/docs" --destination "$DEV_REPO_ROOT/_site"
}
