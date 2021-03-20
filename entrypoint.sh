#! /usr/bin/env bash

set -Eeuo pipefail
set -x

# Filter out arguments that are not available to this action
# args:
#   $@: Arguments to be filtered
parse_args() {
  local opts=""
  while (( "$#" )); do
    case "$1" in
      -q|--quiet)
        opts="$opts -q"
        shift
        ;;
      -c)
        opts="$opts -c $2"
        shift 2
        ;;
      -p)
        opts="$opts -p"
        shift
        ;;
      -r)
        opts="$opts -r $2"
        shift 2
        ;;
      -R)
        opts="$opts -R"
        shift
        ;;
      -t)
        opts="$opts -t $2"
        shift 2
        ;;
      -x)
        opts="$opts -x $2"
        shift 2
        ;;
      --exclude)
        opts="$opts --exclude=$2"
        shift 2
        ;;
      --no-color)
        opts="$opts --no-color"
        shift
        ;;
      --parseable-severity)
        opts="$opts --parseable-severity"
        shift
        ;;
      --) # end argument parsing
        shift
        break
        ;;
      -*) # unsupported flags
        >&2 echo "ERROR: Unsupported flag: '$1'"
        exit 1
        ;;
      *) # positional arguments
        shift  # ignore
        ;;
    esac
  done

  # set remaining positional arguments (if any) in their proper place
  eval set -- "$opts"

  echo "${opts/ /}"
  return 0
}

override_python_packages() {
  [[ -n "${INPUT_OVERRIDE_DEPS-}" ]] && pip install ${INPUT_OVERRIDE_DEPS} && pip check
  >&2 echo "Completed installing override dependencies..."
}

# Generates client.
# args:
#   $@: additional options
# env:
#   INPUT_TARGETS : Files or directories (i.e., playbooks, tasks, handlers etc..) to be linted
ansible::lint() {
  : "${GITHUB_WORKSPACE?GITHUB_WORKSPACE has to be set. Did you use the actions/checkout action?}"
  pushd "${GITHUB_WORKSPACE}"

  override_python_packages
  local opts
  opts=$(parse_args $@ || exit 1)

  # Enable recursive glob patterns, such as '**/*.yml'.
  shopt -s globstar
  ansible-lint -v --force-color $opts ${INPUT_TARGETS=}
  shopt -u globstar
}

if [ -n "${INPUT_ARGS-}" ]; then
    IFS=' ' read -r -a args <<< "$INPUT_ARGS"
else
    args=()
fi

if [ "$0" = "${BASH_SOURCE[*]}" ] ; then
  >&2 echo -E "\nRunning Ansible Lint...\n"
  ansible::lint "${args[@]}"
fi
