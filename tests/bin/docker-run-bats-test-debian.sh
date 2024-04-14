#!/bin/bash

docker run --network host --rm -w /working -v $(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock \
  -e "WORKSPACE=/working" \
  -e "TEST_PLATFORM=debian" \
  siakhooi/shed-tester:debian-bats \
  /working/tests/bin/in-container-init-test.sh
