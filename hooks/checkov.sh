#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

checkov -d .

exit ${VALIDATE_ERROR}