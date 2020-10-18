# GCP Dataflow Demo

### Edit _optional_
```
../env.sh
```

[Setup](../pubsub/README.md) Pub/Sub

[Setup](../bigquery/README.md) BigQuery

### Submit Template;
```
./bin/submit-pubsub-to-bq.sh
```

### Write messages;
```
./bin/write-msg.sh
```

### Verify;
```
```

#### or visit;
[gcp console](https://console.cloud.google.com/dataflow/jobs)

### Clean up;
```
./pubsub/bin/clean-pubsub.sh
./bigquery/bin/rm.sh
./dataflow/bin/clean.sh
```