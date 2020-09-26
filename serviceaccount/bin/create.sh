#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

sa="${1:-$default_function_sa}"

gcloud iam service-accounts create "${sa}" \
  --description="cloud functions service account" \
  --display-name="${sa}"
