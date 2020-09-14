#!/usr/bin/env bash

cd $( dirname "${BASH_SOURCE[0]}" )
source ./env.sh

topic="${1:-default_topic}"

# https://cloud.google.com/sdk/gcloud/reference/beta/emulators/pubsub
gcloud beta emulators pubsub start
