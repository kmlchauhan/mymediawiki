KOPS_AVAILABLE=`which kops`
KOPS_LATEST=`curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4`

function install_kops {
  if [ -z ${KOPS_AVAILABLE} ]; then
     curl -LO https://github.com/kubernetes/kops/releases/download/${KOPS_LATEST}/kops-linux-amd64
     chmod +x kops-linux-amd64
     sudo mv kops-linux-amd64 /usr/local/bin/kops
     kops version
  else
     echo "kops is most likely installed"
  fi
}

install_kops
