#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
cd ../
source ./env.sh
cd -

cluster=${1:-$default_cluster}

gcloud dataproc clusters describe "${cluster}"
