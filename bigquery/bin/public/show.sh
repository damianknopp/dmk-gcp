#!/usr/bin/env bash

bq show \
--schema \
--format=prettyjson \
bigquery-public-data:samples.shakespeare