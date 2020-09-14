#!/usr/bin/env bash

cd $( dirname "${BASH_SOURCE[0]}" )
source ./env.sh

topic="${1:-$default_topic}"
msg=${2:-"hello"}
# https://cloud.google.com/pubsub/docs/quickstart-cli
gcloud pubsub topics publish "${topic}" --message="${msg}"