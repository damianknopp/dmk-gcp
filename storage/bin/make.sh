#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

proj="${1:-$default_project}"
storage="${2:-NEARLINE}"
bucket="${3:-$default_bucket}"
location="${4:-$default_location}"

gsutil mb -p "${proj}" \
  -c "${storage}" \
  -l "${location}" \
  -b on \
  gs://"${bucket}"
