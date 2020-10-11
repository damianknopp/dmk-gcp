#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
cd ../
source ./env.sh
cd -

project="${1:-$default_project}"
cluster=${2:-$default_cluster}
#projectid=""

num_workers=2

#  --enable-component-gateway
#  --service-account "${projectid}-compute@developer.gserviceaccount.com" \
# you may need to grant dataproc.worker to run this command
gcloud dataproc clusters create "${cluster}" \
  --tags "${cluster}" \
  --master-boot-disk-size 500 \
  --master-machine-type 'n2-standard-4' \
  --worker-machine-type 'n2-standard-2' \
  --image-version 1.5-debian10 \
  --num-workers "${num_workers}" \
  --num-preemptible-workers "${num_workers}" \
  --num-masters 1 \
  --scopes default,bigquery \
  --project "${project}" \
  --async
