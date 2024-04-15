info:

clean:
	rm -rf target *.deb *.deb.*sum
delete-clusters:
	 kind delete clusters kube-test-1 kube-dev-1
set-version:
	scripts/set-version.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh
delete-release:
	gh release delete --cleanup-tag 1.14.0

clean-bats-logs:
	rm tests/bats-test-result-*.log
prepare:
	. scripts/prepare-environments-in-codespace.sh
build: clean
	./scripts/shellcheck.sh
	./scripts/build.sh

prepare-bats: docker-pull-bats-debian docker-pull-kind docker-pull-bats-ubuntu

run-bats-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock \
	-e "WORKSPACE=/working" \
	-e "TEST_PLATFORM=debian" \
	siakhooi/shed-tester:debian-bats \
	bash

#	tests/bin/prepare-environments.sh
#	tests/bin/prepare-kind-clusters.sh
#	tests/bin/bats-test-run.sh
#	tests/bin/teardown-kind-clusters.sh

bats-debian:
	tests/bin/docker-run-bats-test-debian.sh
bats-ubuntu:
	tests/bin/docker-run-bats-test-ubuntu.sh

## troubleshooting

test-man:
	pandoc src/md/shed-config.1.md -s -t man | man -l -
#	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -

reinstall:
	apt remove -y siakhooi-shed
	apt install -y -f ./siakhooi-shed_*_amd64.deb

build-all-images: build-all-images-bats
build-all-images-bats: build-image-bats-debian build-image-bats-ubuntu
build-image-bats-debian:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_debian -t shed-tester:debian-bats -t siakhooi/shed-tester:debian-bats
build-image-bats-ubuntu:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu-bats -t siakhooi/shed-tester:ubuntu-bats

docker-pull-bats-ubuntu:
	docker pull siakhooi/shed-tester:ubuntu-bats
docker-pull-bats-debian:
	docker pull siakhooi/shed-tester:debian-bats
docker-pull-kind:
	docker pull kindest/node:v1.26.3

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
	shed-istioctl
	k
	h
	i

	completion kubectl, k, shed-kubectl
	completion helm, h, shed-helm
	completion istioctl, i, shed-istioctl
