#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

job_id="${1}"
region="${2:-$default_location}"

gcloud dataflow jobs describe --region="${region}" "${job_id}"
