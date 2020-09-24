#!/usr/bin/env bash

# https://cloud.google.com/bigquery/docs/quickstarts/quickstart-command-line#run_a_query
bq query --use_legacy_sql=false \
'SELECT
   word,
   SUM(word_count) AS count
 FROM
   `bigquery-public-data`.samples.shakespeare
 WHERE
   word LIKE "%raisin%"
 GROUP BY
   word'