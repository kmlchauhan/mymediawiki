#!/bin/bash

PACKER_ZIP_FILE=packer_1.2.5_linux_amd64.zip
PACKER=https://releases.hashicorp.com/packer/1.2.5
PACKER_BIN=packer

function install_packer {
    if [ -z $(which $PACKER_BIN) ]; then
       wget ${PACKER}/${PACKER_ZIP_FILE}
       unzip ${PACKER_ZIP_FILE}
       sudo mv ${PACKER_BIN} /usr/local/bin/${PACKER_BIN}
       rm -rf ${PACKER_ZIP_FILE}
       packer version
    else
       echo "${PACKER_BIN} is most likely installed"
    fi
}

sudo apt-get install unzip -y

install_packer
