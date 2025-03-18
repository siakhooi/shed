info:

#
# Clean up
#

clean:
	rm -rf target *.deb *.deb.*sum tests/bats-test-result-*.log

clean-bats-logs:
	rm tests/bats-test-result-*.log

#
# Build
#

set-version:
	scripts/set-version.sh
build: clean
	./scripts/shellcheck.sh
	./scripts/build.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh

delete-release:
	gh release delete --cleanup-tag 1.17.1

#
# Full Test
#
bats-teardown:
	tests/bin/teardown-kind-clusters.sh

bats-debian:
	tests/bin/docker-run-bats-test-debian.sh | highlight.red "not ok"
bats-ubuntu:
	tests/bin/docker-run-bats-test-ubuntu.sh | highlight.red "not ok"

#
# Prepare Test Images
#
wf-build-all-images:
	gh workflow run 'Build all images'

prepare-bats: docker-pull-bats-debian docker-pull-kind docker-pull-bats-ubuntu

build-all-images: build-image-bats-debian build-image-bats-ubuntu
build-image-bats-debian:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_debian -t shed-tester:debian-bats -t siakhooi/shed-tester:debian-bats
build-image-bats-ubuntu:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu-bats -t siakhooi/shed-tester:ubuntu-bats

docker-images:
	docker images siakhooi/shed-tester
docker-pull-bats-ubuntu:
	docker pull siakhooi/shed-tester:ubuntu-bats
docker-pull-bats-debian:
	docker pull siakhooi/shed-tester:debian-bats
docker-pull-kind:
	docker pull kindest/node:v1.29.2

#
#
#

init-codespace: prepare build prepare-bats


delete-clusters:
	 kind delete clusters kube-test-1 kube-dev-1

prepare:
	. scripts/prepare-environments-in-codespace.sh

run-bats-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock \
	-e "WORKSPACE=/working" \
	-e "TEST_PLATFORM=debian" \
	siakhooi/shed-tester:debian-bats \
	bash
run-bats-ubuntu:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock \
	-e "WORKSPACE=/working" \
	-e "TEST_PLATFORM=ubuntu" \
	siakhooi/shed-tester:ubuntu-bats \
	bash

deploy-in-docker:
	tests/bin/prepare-environments.sh
in-docker-setup:
	tests/bin/prepare-environments.sh
	tests/bin/prepare-kind-clusters.sh


## troubleshooting

test-man:
	pandoc src/md/shed-config.1.md -s -t man | man -l -
#	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -

reinstall:
	apt remove -y siakhooi-shed
	apt install -y -f ./siakhooi-shed_*_amd64.deb


init-terminalizer:
	. screenshots_src/in-container-setup.sh

terminalizer:
	terminalizer render docs/terminalizer-shed.yml

test-steps:
# docker exec -it xxxxx bash
	shed-config-edit
	shed-use
	shed
	shed-kubeconfig-use
	c0
	c1
	c2
	c3
	c4
	shed-kubectl
	shed-helm
	k
	h

	completion kubectl, k, shed-kubectl
	completion helm, h, shed-helm
