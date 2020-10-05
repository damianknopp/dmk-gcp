#!/usr/bin/env bash

gcloud projects add-iam-policy-binding "${project}" \
    --member=serviceAccount:$projid-compute@developer.gserviceaccount.com \
    --role='roles/dataproc.worker'
