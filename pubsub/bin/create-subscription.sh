#!/usr/bin/env bash

cd $( dirname "${BASH_SOURCE[0]}" ) || exit
source ./env.sh

topic="${1:-$default_topic}"
subscription="${2:-$default_subscription}"

gcloud pubsub subscriptions create "${subscription}" --topic "${topic}"
