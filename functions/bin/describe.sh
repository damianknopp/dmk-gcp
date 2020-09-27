#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

project="${1:-$default_project}"
function="${2:-$default_function}"
location="${3:-$default_location}"

gcloud functions describe \
  --project "${project}" \
  --region "${location}" \
  "${function}"
