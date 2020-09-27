#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../../env.sh

project="${1:-$default_project}"
sa="${2:-$default_function_sa}"
function="${3:-bucket-watcher}"
location="${4:-$default_location}"
bucket="${5:-$default_bucket}"

gcloud functions deploy "${function}" \
  --runtime nodejs12 \
  --entry-point gcsToPubSub \
  --trigger-resource "${bucket}" \
  --service-account "$sa@$project.iam.gserviceaccount.com" \
  --region "${location}" \
  --trigger-event google.storage.object.finalize
