#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
cd ../
source ./env.sh
cd -

region="${1:-$default_location}"
cluster="${2:-$default_cluster}"

gcloud dataproc jobs submit spark \
  --cluster="${cluster}" \
  --region="${region}" \
  --class=org.apache.spark.examples.SparkPi \
  --jars=file:///usr/lib/spark/examples/jars/spark-examples.jar \
  -- 1000
