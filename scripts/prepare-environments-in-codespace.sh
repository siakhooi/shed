#!/bin/bash

sudo wget https://siakhooi.github.io/apt/siakhooi-apt.list -O /etc/apt/sources.list.d/siakhooi-apt.list 
sudo wget https://siakhooi.github.io/apt/siakhooi-apt.gpg  -O /usr/share/keyrings/siakhooi-apt.gpg 
sudo apt update -y && sudo apt install -y shellcheck pandoc dpkg-dev fakeroot
sudo curl -L -o /usr/bin/kind https://kind.sigs.k8s.io/dl/v0.18.0/kind-linux-amd64 && sudo chmod +x /usr/bin/kind
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq
