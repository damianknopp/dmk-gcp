#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

dataset="${1:-$default_dataset}"
table="${2:-$default_table}"

#  qtr:STRING,sales:FLOAT,year:STRING
bq mk \
  --table "${default_dataset}.${table}" \
  cdatetime:DATETIME,address:STRING,district:INT64,beat:STRING,grid:INT64,crimedescr:STRING,ucr_ncic_code:INT64,latitude:FLOAT64,longitude:FLOAT64
