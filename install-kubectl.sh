#!/bin/bash

KUBECTL_AVAILABLE=`which kubectl`
KUBECTL_LATEST=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
KUBECTL_BIN=kubectl

function install_kubectl {
    if [ -z ${KUBECTL_AVAILABLE} ]; then
       curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_LATEST}/bin/linux/amd64/${KUBECTL_BIN}
       chmod +x ${KUBECTL_BIN}
       sudo mv ${KUBECTL_BIN} /usr/local/bin/${KUBECTL_BIN}
       ${KUBECTL_BIN} version
    else
       echo "${KUBECTL_BIN} is most likely installed"
    fi
}

install_kubectl
