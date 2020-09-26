#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

project="${1:-$default_project}"
sa="${1:-$default_sa}"

mkdir -p "${HOME}/.gcp"
gcloud iam service-accounts keys create \
  "${HOME}/.gcp/key.json" \
  --iam-account "$sa@$project.iam.gserviceaccount.com"
