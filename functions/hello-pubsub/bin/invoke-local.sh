#!/usr/bin/env bash

set -x

data=$(printf 'this is a test message!'|base64)
json=$(cat << EOM
{
  "data": {
    "data": "${data}"
  }
}
EOM)
curl -X POST -H 'Content-Type: application/json' --data "${json}" http://localhost:8080
