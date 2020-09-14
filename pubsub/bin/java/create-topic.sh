#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ../env.sh
cd -

project="${1:-$default_project}"
topic="${2:-$default_topic}"

time mvn -e -q exec:java \
  -Dexec.mainClass="dmk.gcp.cli.CreateTopic" \
  -Dexec.args="${project} ${topic}"
