#!/bin/bash

apt install -y nano

DEBFILE=$(find . -name '*.deb')
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc

# prepare configs
mkdir -p ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-D ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-T ~/.shed/kubectl-config
cp -v test/test-configs/config.yaml  ~/.shed/config.yaml
cp -r -v test/test-configs/kubectl-resources ~/.shed/kubectl-resources

source /usr/lib/shed/shed-init
