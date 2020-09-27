#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../../env.sh

project="${1:-$default_project}"
sa="${2:-$default_function_sa}"
function="${3:-$default_function}"
location="${4:-$default_location}"

gcloud functions deploy "${function}" \
  --entry-point helloHttp \
  --runtime nodejs12 \
  --service-account "$sa@$project.iam.gserviceaccount.com" \
  --region "${location}" \
  --trigger-http
