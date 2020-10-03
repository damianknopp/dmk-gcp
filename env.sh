#!/usr/bin/env bash

# print commands before running
#set -x

prefix="dmk"
export default_project="${prefix}-gcp-demo"

# appengine
export default_appengine_service="${prefix}-appengine-demo"
# function
export default_function="${prefix}-function"
export default_function_sa="${prefix}-functions-sa"

# storage
export default_location="us-east4" # nova
#export default_location="us-east1" # sc
export default_bucket="${prefix}-bucket"
export default_project="${prefix}-gcp-demo"

# bigquery
export default_dataset="${prefix}dataset"
export default_table="${prefix}table"

# pubsub
export default_sa="${prefix}-pubsub-sa"
export default_topic="${prefix}-topic"
export default_dlq="${default_topic}-dlq"
export default_subscription="${prefix}-subscription"

# dataproc
export default_cluster="${prefix}-cluster"
