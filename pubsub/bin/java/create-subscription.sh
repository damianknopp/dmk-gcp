#!/usr/bin/env bash

pushd $(dirname "${BASH_SOURCE[0]}")
pushd ../
source ./env.sh
popd
popd

project="${1:-$default_project}"
topic="${2:-$default_topic}"
subscription="${3:-$default_subscription}"
topicId="projects/${project}/topics/${topic}"
subscriptionId="projects/${project}/subscriptions/${subscription}"

time mvn -e -q exec:java \
  -Dexec.mainClass="dmk.gcp.cli.CreateSubscription" \
  -Dexec.args="${project} ${topicId} ${subscriptionId}"
