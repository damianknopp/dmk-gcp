#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

region="${1:-$default_location}"

gcloud dataflow jobs list --region="${region}"
