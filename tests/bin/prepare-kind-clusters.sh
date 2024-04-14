#!/bin/bash

docker pull kindest/node:v1.26.3
kind create cluster --name kube-dev-1 --image=kindest/node:v1.26.3 --wait 10m
kind create cluster --name kube-test-1 --image=kindest/node:v1.26.3 --wait 10m
kubectl --context kind-kube-dev-1 create ns ns-application
kubectl --context kind-kube-dev-1 create ns ns-database
