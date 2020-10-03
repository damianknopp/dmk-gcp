#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
source ./env.sh

zone="${1:-$default_location}"
gcloud compute zones describe "${zone}-a"
