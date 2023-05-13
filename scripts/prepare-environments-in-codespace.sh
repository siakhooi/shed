#!/bin/bash

sudo wget https://siakhooi.github.io/apt/siakhooi-apt.list -O /etc/apt/sources.list.d/siakhooi-apt.list 
sudo wget https://siakhooi.github.io/apt/siakhooi-apt.gpg  -O /usr/share/keyrings/siakhooi-apt.gpg 
sudo apt update -y && sudo apt install -y shellcheck pandoc dpkg-dev siakhooi-shed
sudo curl -L -o /usr/bin/kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64 && sudo chmod +x /usr/bin/kind
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq

# prepare configs
mkdir -p ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-D ~/.shed/kubectl-config
cp -v test/test-configs/kubeconfig-T ~/.shed/kubectl-config
cp -v test/test-configs/config.yaml  ~/.shed/config.yaml

echo 'source /usr/lib/shed/shed-init' >>~/.bashrc
