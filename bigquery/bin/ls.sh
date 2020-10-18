#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

dataset="${1:-$default_dataset}"

bq ls -p
bq ls -d
bq ls "${dataset}"
