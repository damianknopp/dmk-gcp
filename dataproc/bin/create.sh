#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

cluster=${1:-$default_cluster}
project=""
projectid=""

# you may need to grant dataproc.worker to run this command
gcloud dataproc clusters create "${cluster}" \
  --tags "${cluster}" \
  --master-boot-disk-size 500 \
  --master-machine-type 'n2-standard-4' \
  --worker-machine-type 'n2-standard-2' \
  --image-version 1.5-debian10 \
  --num-workers 2 \
  --num-masters 1 \
  --scopes default,bigquery \
  --project "${project}" \
  --service-account "'${projectid}-compute@developer.gserviceaccount.com'" \
  --async
