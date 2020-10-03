#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh
cd -

default_function="hello-pubsub"
region="${1:-$default_location}"
topic="${2:-$default_topic}"
function="${3:-$default_function}"

gcloud functions deploy "${function}" \
  --entry-point dmk.gcp.functions.PubSubBackground \
  --runtime java11 \
  --memory 512MB \
  --region "${region}" \
  --trigger-topic "${topic}"
