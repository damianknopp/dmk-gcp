#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

topic="${1:-$default_topic}"

gcloud pubsub topics list
gcloud pubsub topics list-subscriptions "${topic}"
