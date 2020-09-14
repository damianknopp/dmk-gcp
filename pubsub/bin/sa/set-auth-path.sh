#!/usr/bin/env bash

# source this file
# eg: source ./bin/sa/set-auth-path.sh
# printenv | grep CREDENTIALS
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.gcp/key.json"
