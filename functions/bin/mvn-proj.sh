#!/usr/bin/env bash

mvn archetype:generate \
-DgroupId=dmk.gcp \
-DartifactId=hello-pubsub \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DinteractiveMode=false
