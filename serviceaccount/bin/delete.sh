#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

sa="${1:-$default_sa}"

gcloud iam service-accounts delete "${sa}"