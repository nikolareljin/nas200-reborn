#!/usr/bin/env bash

project_test() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}

project_install() {
  git submodule update --init --recursive
  dev_install_hooks
  bundle config set path vendor/bundle
  bundle install
}

project_build() {
  case "${DEV_TARGET:-docs}" in
    ""|docs)
      bash "$DEV_REPO_ROOT/scripts/check.sh"
      bundle exec jekyll build --source "$DEV_REPO_ROOT/docs" --destination "$DEV_REPO_ROOT/_site"
      ;;
    *) not_applicable build "only documentation checks exist in the foundation release" ;;
  esac
}

project_preflight() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}

project_site() {
  bundle exec jekyll serve --source "$DEV_REPO_ROOT/docs" --destination "$DEV_REPO_ROOT/_site"
}
