#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../../env.sh

project="${1:-$default_project}"
location="${2:-$default_location}"
function="${3:-$default_function}"

curl -X GET \
  -k "https://${location}-${project}.cloudfunctions.net/${function}" \
  -H "Authorization: Bearer $(gcloud auth print-identity-token)"
