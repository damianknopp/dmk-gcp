#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

cluster=${1:-$default_cluster}

gcloud dataproc clusters create "${cluster}" \
  --tags="${cluster}" \
  --num-workers=2 \
  --num-masters=1 \
  --async
