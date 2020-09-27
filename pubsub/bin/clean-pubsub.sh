#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

topic="${1:-$default_topic}"
subscription="${2:-$default_subscription}"
dlq="${3:-$default_dlq}"

gcloud pubsub subscriptions delete "${subscription}"
gcloud pubsub topics delete "${topic}"
gcloud pubsub topics delete "${dlq}"
