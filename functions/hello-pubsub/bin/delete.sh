#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

default_function="hello-pubsub"
project="${1:-$default_project}"
location="${2:-$default_location}"
function="${3:-$default_function}"

gcloud functions delete "${function}" \
  --region "${location}"
