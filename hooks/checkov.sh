#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

for dir in $(echo "$@" | xargs -n1 dirname | sort -u | uniq); do
  echo "--> Running 'terraform validate' in directory '$dir'"
  pushd "$dir" >/dev/null
  checkov -d .
  popd >/dev/null
done

exit