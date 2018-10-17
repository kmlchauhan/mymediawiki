#!/bin/bash

rm -f ~/.kube/config
kops export kubecfg --name $KOPS_NAME

echo "=================================================================================================================================="
cat ~/.kube/config | grep -i username | head -n 1
cat ~/.kube/config | grep -i password | head -n 1
echo " url: https://api.${KOPS_NAME}/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard/#/persistentvolume?namespace=_all"
echo " install dashboard: kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml"
echo "=================================================================================================================================="
