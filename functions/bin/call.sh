#!/usr/bin/env bash

set -x
cd $(dirname "${BASH_SOURCE[0]}")
source ../../env.sh

function="${1:-$default_function}"
location="${2:-$default_location}"

gcloud functions call "${function}" \
  --region "${location}"
