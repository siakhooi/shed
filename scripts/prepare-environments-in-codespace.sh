#!/bin/bash

KIND_VERSION=v0.19.0

sudo apt update -y && sudo apt install -y shellcheck pandoc dpkg-dev fakeroot
sudo curl -L -o /usr/bin/kind https://kind.sigs.k8s.io/dl/$KIND_VERSION/kind-linux-amd64 && sudo chmod +x /usr/bin/kind
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq
