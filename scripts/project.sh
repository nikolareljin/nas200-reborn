#!/usr/bin/env bash

project_test() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}

project_build() {
  case "${DEV_TARGET:-docs}" in
    ""|docs) bash "$DEV_REPO_ROOT/scripts/check.sh" ;;
    *) not_applicable build "only documentation checks exist in the foundation release" ;;
  esac
}

project_preflight() {
  bash "$DEV_REPO_ROOT/scripts/check.sh"
}
