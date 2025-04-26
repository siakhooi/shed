#!/bin/bash

set -ex
apt update -y

DEBFILE=$(find . -name '*.deb')
apt remove -y siakhooi-shed
apt install -y "$DEBFILE"
echo 'source /usr/lib/shed/shed-init' >>~/.bashrc

# prepare configs
rm -rf ~/.shed
cp -r -v tests/resources/shed-config ~/.shed
