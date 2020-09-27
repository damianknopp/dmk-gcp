#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

dlq="${1:-$default_dlq}"
gcloud pubsub topics create "${dlq}"
