#!/bin/bash

docker run --network host --rm -t -w /working -v "$(pwd):/working" -v /var/run/docker.sock:/var/run/docker.sock \
  -e "WORKSPACE=/working" \
  -e "TEST_PLATFORM=ubuntu" \
  siakhooi/shed-tester:ubuntu-bats \
  /working/tests/bin/in-container-init-test.sh
