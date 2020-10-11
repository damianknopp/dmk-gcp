#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
cd ../
source ./env.sh
cd -

gcloud dataproc clusters list
