#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh

project="${1:-$default_project}"
sa="${1:-$default_sa}"

# to run this you need; roles/iam.serviceAccountKeyAdmin
gcloud projects add-iam-policy-binding "${project}" \
  --member="serviceAccount:$sa@$project.iam.gserviceaccount.com" \
  --role=roles/pubsub.viewer \
  --role=roles/pubsub.publisher \
  --role=roles/pubsub.subscriber
