#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}") || exit
source ./env.sh

gcloud app instances list
