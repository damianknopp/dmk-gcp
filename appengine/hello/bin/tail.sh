#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}") || exit
source ./env.sh

service="${1:-$default_appengine_service}"

gcloud app logs tail -s "${service}"