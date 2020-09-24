#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

subscription="${1:-$default_subscription}"
# https://cloud.google.com/pubsub/docs/quickstart-cli
gcloud pubsub subscriptions pull "${subscription}" --auto-ack
