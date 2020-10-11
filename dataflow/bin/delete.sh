#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

project="${1:-$default_project}"
region="${2:-$default_location}"
out_bucket="${3:-$default_bucket}"/dataflow-out
topic="${4:-$default_topic}"
dataset="${5:-$default_dataset}"
table="${6:-$default_table}"
flow="${7:-$default_flow}"

# https://cloud.google.com/dataflow/docs/guides/templates/provided-streaming#gcloud_1
gcloud dataflow jobs cancel "${flow}" \
  --gcs-location gs://dataflow-templates/latest/PubSub_to_BigQuery \
  --region "${region}" \
  --staging-location "gs://${out_bucket}" \
  --parameters \
  inputTopic=projects/"${project}"/topics/"${topic}",outputTableSpec="${project}":"${dataset}"."${table}"
