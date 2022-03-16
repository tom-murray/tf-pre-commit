#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

export TF_IN_AUTOMATION=1

VALIDATE_ERROR=0

for dir in $(echo "$@" | xargs -n1 dirname | sort -u | uniq); do
  echo "--> Running 'terraform validate' in directory '$dir'"
  pushd "$dir" >/dev/null
  terraform init -backend=false || VALIDATE_ERROR=$?
  terraform validate || VALIDATE_ERROR=$?
  popd >/dev/null
done

exit ${VALIDATE_ERROR}