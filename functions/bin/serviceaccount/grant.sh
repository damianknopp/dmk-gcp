#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh

project="${1:-$default_project}"
sa="${2:-$default_function_sa}"

# to run this you need; roles/iam.serviceAccountKeyAdmin
gcloud projects add-iam-policy-binding "${project}" \
  --member="serviceAccount:$sa@$project.iam.gserviceaccount.com" \
  --role=roles/viewer \
  --role=roles/editor \
  --role=roles/storage.objectAdmin \
  --role=roles/storage.admin \
  --role=roles/storage.hmacKeyAdmin
