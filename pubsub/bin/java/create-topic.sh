#!/usr/bin/env bash

pushd $(dirname "${BASH_SOURCE[0]}")
pushd ../
source ./env.sh
popd
popd

project="${1:-$default_project}"
topic="${2:-$default_topic}"

time mvn -e -q exec:java \
  -Dexec.mainClass="dmk.gcp.cli.CreateTopic" \
  -Dexec.args="${project} ${topic}"
