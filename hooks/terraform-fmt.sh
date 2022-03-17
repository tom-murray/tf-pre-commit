#!/usr/bin/env bash

set -e

original_path=$PATH
export PATH=$PATH:/usr/local/bin

FMT_ERROR=0

terraform fmt -recursive || FMT_ERROR=$?

export PATH=$original_path

exit ${FMT_ERROR}