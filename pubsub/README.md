# GCP Pub/Sub Demo

Edit _optional_
```
../env.sh
```

Create topics and subscriptions
Run;
```
./bin/create-dlq.sh
./bin/create-topic.sh 
./bin/create-subscription.sh 
```

Verify;
```
./bin/list.sh
```

or visit;
[gcp console](https://console.cloud.google.com/cloudpubsub/topic/list)

Test wth CLI;
```
./bin/write-msg.sh
./bin/read-msg.sh
```

Test with Java app;
```
./bin/java/build.sh
./bin/java/read-msgs.sh
./bin/java/write-msgs.sh
```

Clean up;
```
./bin/clean-pubsub.sh
```