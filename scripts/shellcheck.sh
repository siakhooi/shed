#!/bin/bash
set -e

shellcheck \
  src/bin/* \
  src/DEBIAN/post* \
  src/lib/shed* \
  src/lib/init.d/shed-init/* \
  src/lib/init.d/shed-kubeconfig-use/* \
  src/lib/init.d/shed-use/*
