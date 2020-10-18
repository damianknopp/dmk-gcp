# GCP BigQuery Demo

### Edit _optional_
```
../env.sh
```

### Make dataset
Run;
```
./bin/make-dataset1.sh
```

### Make table
Run;
```
./bin/make-table1.sh
```

### Verify;
```
./bin/ls.sh
./bin/show.sh
./bin/query1.sh
```

#### or visit;
[gcp console](https://console.cloud.google.com/bigquery)

### Load data;
Load a sample CSV from local disk

```
./bin/load1.sh
```

Or Load from a [dataflow job](../dataflow/README.md)

### Clean up;
```
./bin/remove.sh
```