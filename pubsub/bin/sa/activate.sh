#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh

project="${1:-$default_project}"
sa="${1:-$default_sa}"

gcloud auth activate-service-account \
 "$sa@$project.iam.gserviceaccount.com" \
 --key-file="${HOME}/.gcp/key.json" \
 --project="${project}"
