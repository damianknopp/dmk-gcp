#!/usr/bin/env bash

cd $( dirname "${BASH_SOURCE[0]}" )
source ./env.sh

project="${1:-$default_project}"
gcloud config set project "${project}"
gcloud config list