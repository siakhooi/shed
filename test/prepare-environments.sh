#!/bin/bash

DEBFILE=$(find . -name '*.deb')
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc

# test related
mkdir -p ~/.shed/kubectl-config
cp -v test/kubeconfig-D ~/.shed/kubectl-config
cp -v test/kubeconfig-T ~/.shed/kubectl-config
## test related end

docker pull kindest/node:v1.26.3
kind create cluster --name kube-dev-1 --image=kindest/node:v1.26.3 --wait 10m
kind create cluster --name kube-test-1 --image=kindest/node:v1.26.3 --wait 10m
kubectl --context kind-kube-dev-1 create ns ns-application
kubectl --context kind-kube-dev-1 create ns ns-database

source /usr/lib/shed/shed-init

/usr/lib/shed/shed-config-create-sample
