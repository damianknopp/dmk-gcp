#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh
cd -

project="${1:-$default_project}"
topic="${2:-$default_topic}"
subscription="${3:-$default_subscription}"
topicId="projects/${project}/topics/${topic}"
subscriptionId="projects/${project}/subscriptions/${subscription}"

time mvn -e -q exec:java \
  -Dexec.mainClass="dmk.gcp.cli.CreateSubscription" \
  -Dexec.args="${project} ${topicId} ${subscriptionId}"
