#!/usr/bin/env bash

pushd $(dirname "${BASH_SOURCE[0]}")
pushd ../
source ./env.sh
popd
popd

project="${1:-$default_project}"
subscription="${2:-$default_subscription}"

time mvn -e -q exec:java \
  -Dexec.mainClass="dmk.gcp.cli.SubscribeAsyncExample" \
  -Dexec.args="${project} ${subscription}"
