#!/bin/sh -l

verbosity_level="${1}"
lintable_path="${2}"

# if env variable GITHUB_SARIF is set
# redirect the SARIF output into the file name specified by the env variable
if [[ -z "${GITHUB_SARIF}" ]]; then
  ansible-lint $verbosity_level $lintable_path;
else
  ansible-lint $verbosity_level $lintable_path -f sarif > "$GITHUB_SARIF";
fi