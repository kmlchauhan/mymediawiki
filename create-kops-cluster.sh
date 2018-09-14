#!/bin/bash

# *******************************
# Creating Kubernetes HA Cluster
# *******************************

export CLUSTER_NAME=${CLUSER_NAME:-prod.kubernetes.domainname.com}
export NODE_SIZE=${NODE_SIZE:-t2.micro}
export MASTER_SIZE=${MASTER_SIZE:-t2.micro}
export MASTER_ZONES=${MASTER_ZONES:-"us-east-1b,us-east-1c,us-east-1d"}
export ZONES=${ZONES:-"us-east-1b,us-east-1c,us-east-1d"}
export KOPS_STATE_STORE="s3://kopscluster-082618"

./delete-kops-cluster.sh

kops create cluster \
  --name=${CLUSTER_NAME} \
  --state=${KOPS_STATE_STORE} \
  --authorization RBAC \
  --master-zones=${MASTER_ZONES} \
  --zones=${ZONES} \
  --node-count=3 \
  --node-size=${NODE_SIZE} \
  --master-size=${MASTER_SIZE} \
  --master-count=3 \
  --image=ami-04169656fea786776 \
  --dns-zone=domainname.com \
  --cloud-labels="Team=DevOps,Environment=PROD" \
  --out=clustername_terraform \
  --target=terraform \
  --kubernetes-version "1.11.0" \
  --bastion \
  --topology=private \
  --networking=weave \
  --ssh-public-key=~/.ssh/kmlchauhan_terraform1.pub

#./pull-kubeconfig.sh
