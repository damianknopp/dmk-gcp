#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

dataset="${1:-$default_dataset}"
table="${2:-$default_table}"

bq mk "${default_dataset}"
