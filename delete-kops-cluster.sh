#!/bin/bash

export KOPS_STATE_STORE="s3://<bucket-name>"

kops delete cluster \
  --name=<cluster-name> \
  --yes \
  --state=${KOPS_STATE_STORE}
