#!/bin/bash

readonly KIND_NODE_IMAGE=kindest/node:v1.29.2

set -e
docker pull $KIND_NODE_IMAGE
kind create cluster --name kube-dev-1 --image=$KIND_NODE_IMAGE --wait 10m
kind create cluster --name kube-test-1 --image=$KIND_NODE_IMAGE --wait 10m
kubectl --context kind-kube-dev-1 create ns ns-application
kubectl --context kind-kube-dev-1 create ns ns-database
