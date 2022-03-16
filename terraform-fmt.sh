#!/usr/bin/env bash

set -e

original_path=$PATH
export PATH=$PATH:/usr/local/bin

FMT_ERROR=0

for file in "$@"; do
  terraform fmt -diff "$file" || FMT_ERROR=$?
done

export PATH=$original_path

exit ${FMT_ERROR}