#!/bin/bash

(
  cd /opt
  curl -LO https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.gz
  tar xf node-v18.15.0-linux-x64.tar.gz
)

export PATH=/opt/node-v18.15.0-linux-x64/bin:$PATH
echo "export PATH=/opt/node/bin:$PATH " >>~/.bashrc

npm i -g terminalizer
