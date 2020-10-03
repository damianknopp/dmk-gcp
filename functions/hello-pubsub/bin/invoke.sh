#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh
cd -

default_function="hello-pubsub"
region="${1:-$default_location}"
topic="${2:-$default_topic}"
function="${3:-$default_function}"

data=$(printf 'this is a test message!' | base64)

gcloud functions call "${function}" \
  --region "${region}" \
  --data '{"data":"'$data'"}'
