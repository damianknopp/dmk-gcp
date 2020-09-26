#!/usr/bin/env bash

# https://cloud.google.com/bigquery/docs/tables#bq_1

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

project="${1:-$default_project}"
dataset="${2:-$default_dataset}"
table="${3:-$default_table}"
location="${4:-$default_location}"

bq --location="${location}" query \
  --destination_table "${project}":"${dataset}"."${table}" \
  --use_legacy_sql=false \
  'SELECT
   word,
   SUM(word_count) AS count
 FROM
   `bigquery-public-data`.samples.shakespeare
 WHERE
   word LIKE "%raisin%"
 GROUP BY
   word'
