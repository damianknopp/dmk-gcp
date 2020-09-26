#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

proj="${1:-$default_project}"
bucket="${2:-$default_bucket}"

gsutil ls -p "${proj}" gs://"${bucket}"
