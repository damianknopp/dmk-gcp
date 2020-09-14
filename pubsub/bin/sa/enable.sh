#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh

project="${1:-$default_project}"
sa="${1:-$default_sa}"

gcloud iam service-accounts enable \
  "$sa@$project.iam.gserviceaccount.com"
