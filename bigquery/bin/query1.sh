#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

dataset="${1:-$default_dataset}"
table="${2:-$default_table}"

# count rows
bq query "select count(*) from ${dataset}.${table}"
# first row
bq query --max_rows 1 "select * from ${dataset}.${table}"