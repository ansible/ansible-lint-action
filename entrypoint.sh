#!/bin/sh
set -eo pipefail

ACTION_PLAYBOOK_NAME="${ACTION_PLAYBOOK_NAME:-playbook.yml}"

set -u

cd "${GITHUB_WORKSPACE}"

ACTION_PLAYBOOK_PATH="${GITHUB_WORKSPACE}/${ACTION_PLAYBOOK_NAME}"

if [ -f "${ACTION_PLAYBOOK_PATH}" ]; then
  >&2 echo
  >&2 echo "==> Linting ${ACTION_PLAYBOOK_PATH}…"
  ansible-lint "${ACTION_PLAYBOOK_PATH}"
  >&2 echo
else
  >&2 echo "==> Can't find '${ACTION_PLAYBOOK_PATH}'.
    Please ensure to set up ACTION_PLAYBOOK_PATH env var
    relative to the root of your project."
  exit 1
fi
