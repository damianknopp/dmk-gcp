#!/usr/bin/env bash

bq query 'select count(*) from publicdata.samples.shakespeare'