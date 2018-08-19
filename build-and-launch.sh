#!/bin/bash
packer build -machine-readable packer-example.json | tee build.log
AMI_ID=`egrep -oe 'ami-.{17}' build.log |tail -n1`
export AMI_ID
echo 'variable "AMI_ID" = "'${AMI_ID}'" }'
./create-kops-cluster.sh
cd krakcconsultants_terraform
terraform init
terraform apply
