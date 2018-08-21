#!/bin/bash

# *******************************
# Creating Kubernetes HA Cluster
# *******************************

kops create cluster \
# This is the name of the cluster
  --name=clustername.com \
# This is S3 bucket on AWS (Object Storage)
  --state=s3://terraform-kops-s3-storage \
# Role Based Authorization
  --authorization RBAC \
# Actual Data Center in N. Virginia
  --zones=ap-south-1a \
# How many nodes we want
  --node-count=2 \
# How much powerful EC2 instance in the cluster we want
  --node-size=t2.micro \
  --master-size=t2.micro \
# How many masters in K8s cluster we want
  --master-count=1 \
# Hosted zone - we need to create it in advance in AWS route53
# you can define your own DNS name
# make sure that you have your own domain name
  --dns-zone=zonename.com \
# This is the name of the output folder where 
# kops will generate ==> Terraform code
  --out=clustername_terraform \
# Target is terraform code
  --target=terraform \
# Create key pair files using this command
# sshkeygen -f ~/.ssh/terraform-key
  --ssh-public-key=~/.ssh/kmlchauhan_terraform1.pub
