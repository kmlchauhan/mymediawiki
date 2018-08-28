#!/bin/bash

# *******************************
# Creating Kubernetes HA Cluster
# *******************************

export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}
export MASTER_ZONES=${MASTER_ZONES:-"us-east-1b,us-east-1c,us-east-1d"}
export ZONES=${ZONES:-"us-east-1b,us-east-1c,us-east-1d"}
export KOPS_STATE_STORE="s3://kopscluster-082618"

kops create cluster \
# This is the name of the cluster
  --name=clustername.com \
# This is S3 bucket on AWS (Object Storage)
  --state=${KOPS_STATE_STORE} \
# Role Based Authorization
  --authorization RBAC \
# Actual Data Center in N. Virginia
  --master-zones=${MASTER_ZONES} \
  --zones=${ZONES} \
# How many nodes we want
  --node-count=3 \
# How much powerful EC2 instance in the cluster we want
  --node-size=${NODE_SIZE} \
  --master-size=${MASTER_SIZE} \
# How many masters in K8s cluster we want
  --master-count=3 \
  --image=ami-04169656fea786776 \
# Hosted zone - we need to create it in advance in AWS route53
# you can define your own DNS name
# make sure that you have your own domain name
  --dns-zone=dnsname.com \
  --cloud-labels="Team=DevOps,Environment=PROD" \
# This is the name of the output folder where 
# kops will generate ==> Terraform code
  --out=clustername_terraform \
# Target is terraform code
  --target=terraform \
# Create key pair files using this command
# sshkeygen -f ~/.ssh/terraform-key
  --ssh-public-key=~/.ssh/kmlchauhan_terraform1.pub
