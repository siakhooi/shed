#!/bin/bash

DEBFILE=$(find . -name '*.deb')
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc
/usr/lib/shed/shed-config-create-sample

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

mkdir -p /working/test/actual-tests
rm -rf /working/test/actual-tests/*

chmod +x /working/test/run-tests.sh
/working/test/run-tests.sh /working/test/actual-tests
RESULT=$?
echo "result: $RESULT"
kind delete clusters kube-dev-1 kube-test-1
exit $RESULT
