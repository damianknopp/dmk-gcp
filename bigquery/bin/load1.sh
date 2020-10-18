#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

set -x
csv="${1:-../../storage/data/SacramentocrimeJanuary2006.csv}"
dataset="${2:-$default_dataset}"
table="${3:-$default_table}"

bq load \
  --autodetect \
  --replace \
  --source_format=CSV \
  "${dataset}.${table}" \
  "${csv}"

