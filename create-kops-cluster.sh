#!/bin/bash

# *******************************
# Creating Kubernetes HA Cluster
# *******************************

kops create cluster \
  --name=krakcconsultants.com \
  --state=s3://kops-state-k070918 \
  --authorization RBAC \
  --zones=ap-south-1a \
  --image=${AMI_ID} \
  --node-count=2 \
  --node-size=t2.micro \
  --master-size=t2.micro \
  --master-count=1 \
  --dns-zone=krakcconsultants.com \
  --out=krakcconsultants_terraform \
  --target=terraform \
  --ssh-public-key=~/kubernetes/kmlchauhan-terraform.pub
