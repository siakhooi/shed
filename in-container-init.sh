#!/bin/bash

apt update -y

apt install wget -y
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

yes | unminimize

apt install -y ./siakhooi-shed_0.3.0_amd64.deb

echo 'source /usr/lib/shed/shed-init' >> ~/.bashrc
