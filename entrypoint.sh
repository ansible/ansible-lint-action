#!/bin/sh
set -e

cd "${GITHUB_WORKSPACE}"

ACTION_PLAYBOOK_NAME="${ACTION_PLAYBOOK_NAME:-playbook.yml}"
ACTION_PLAYBOOK_PATH="${GITHUB_WORKSPACE}/${ACTION_PLAYBOOK_NAME}"

if [ -f "${ACTION_PLAYBOOK_PATH}" ]; then
  echo
  echo "==> Linting ${ACTION_PLAYBOOK_PATH}…"
  ansible-lint "${ACTION_PLAYBOOK_PATH}"
  echo
else
  >&2 echo "Can't find '${ACTION_PLAYBOOK_PATH}'"
  exit 1
fi
