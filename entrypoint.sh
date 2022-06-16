#!/bin/sh -l

verbosity_level="${1}"
lintable_path="${2}"
sarif_output_file="${3}"

# if the argument sarif_output_file is set
# redirect the SARIF output into the specified file name
if [[ -z $output_file ]]; then
  ansible-lint $verbosity_level $lintable_path;
else
  ansible-lint $verbosity_level $lintable_path -f sarif > ${output_file};
fi