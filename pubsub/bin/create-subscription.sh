#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}") || exit
source ./env.sh

topic="${1:-$default_topic}"
subscription="${2:-$default_subscription}"
dlq="${3:-$default_dlq}"
max_delivery_attempts=5

gcloud pubsub subscriptions create "${subscription}" \
  --topic "${topic}" \
  --dead-letter-topic "${dlq}" \
  --max-delivery-attempts "${max_delivery_attempts}" \
