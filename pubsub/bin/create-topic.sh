#!/usr/bin/env bash

cd $( dirname "${BASH_SOURCE[0]}" )
source ./env.sh

topic="${1:-$default_topic}"
gcloud pubsub topics create "${topic}"
