info:

clean:
	rm -rf target *.deb *.deb.*sum test/actual-tests
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
build:
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
test-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:debian bash /working/test/in-container-init-test.sh
test-ubuntu:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:ubuntu bash /working/test/in-container-init-test.sh

## troubleshooting

test-man:
	pandoc src/md/shed-config.1.md -s -t man | man -l -
#	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -

reinstall:
	apt remove -y siakhooi-shed
	apt install -y -f ./siakhooi-shed_*_amd64.deb

build-all-images: build-all-images-bats build-all-images-test
build-all-images-bats: build-image-bats-debian build-image-bats-ubuntu
build-image-bats-debian:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_debian -t shed-tester:debian-bats -t siakhooi/shed-tester:debian-bats
build-image-bats-ubuntu:
	cd tests && docker build . -f resources/Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu-bats -t siakhooi/shed-tester:ubuntu-bats

build-all-images-test: build-debian build-ubuntu
build-debian:
	cd test && docker build . -f Dockerfiles/Dockerfile_debian -t shed-tester:debian -t siakhooi/shed-tester:debian
build-ubuntu:
	cd test && docker build . -f Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu -t siakhooi/shed-tester:ubuntu

docker-pull-bats-ubuntu:
	docker pull siakhooi/shed-tester:ubuntu-bats
docker-pull-bats-debian:
	docker pull siakhooi/shed-tester:debian-bats
docker-pull-kind:
	docker pull kindest/node:v1.26.3
run-shed-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:debian bash
run-shed-ubuntu:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:ubuntu bash

## prepare container environments
prepare-environments:
	. /working/test/prepare-environments.sh
prepare-kind-clusters:
	. /working/test/prepare-kind-clusters.sh
teardown-kind-clusters:
	. /working/test/teardown-kind-clusters.sh

## test development
run-test:
	test/test-scripts/generate-test-output-shed-config-get.sh test/expected

init-full-test:
	. test/in-container-init-test.sh

#	test/generate-test-output.sh test/expected/

init-terminalizer:
	. screenshots_src/in-container-setup.sh

terminalizer:
	terminalizer render docs/terminalizer-shed.yml

kill-kind-clusters:
	docker kill $$(docker ps -a --filter label=io.x-k8s.kind.cluster --format='{{ .Names }}')
	docker rm $$(docker ps -a --filter label=io.x-k8s.kind.cluster --format='{{ .Names }}')

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
