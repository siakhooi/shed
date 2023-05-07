#!/bin/bash

DEBFILE=$(find . -name '*.deb')
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc

# test related
mkdir -p ~/.shed/kubectl-config
cp -v test/kubeconfig-D ~/.shed/kubectl-config
cp -v test/kubeconfig-T ~/.shed/kubectl-config
## test related end

source /usr/lib/shed/shed-init
