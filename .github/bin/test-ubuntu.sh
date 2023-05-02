#!/bin/bash

docker run --network host --rm -w /working -v $(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:ubuntu bash /working/test/in-container-init-test.sh
