#!/bin/bash

DEBFILE=$(find . -name '*.deb')
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc

# prepare configs
mkdir -p ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-D ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-T ~/.shed/kubectl-config
cp -v test/test-configs/config.yaml  ~/.shed/config.yaml

source /usr/lib/shed/shed-init
