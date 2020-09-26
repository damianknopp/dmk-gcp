#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

bucket="${1:-$default_bucket}"

gsutil rb gs://"${bucket}"
