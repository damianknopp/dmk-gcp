#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
cd ../
source ./env.sh
cd -

job_id="${1}"
gcloud dataproc jobs describe "${job_id}"
