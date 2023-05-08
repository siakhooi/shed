info:

prepare:
	sudo apt update -y && sudo apt install -y shellcheck pandoc dpkg-dev
clean:
	rm -rf target *.deb *.deb.*sum test/actual-tests

build:
	./scripts/build.sh

test-man:
	pandoc src/md/shed-kubectl-exec-sh.1.md -s -t man | man -l -

reinstall:
	apt remove -y siakhooi-shed
	apt install -y -f ./siakhooi-shed_*_amd64.deb
generate-expected-outputs:
	test/generate-test-output.sh test/expected/

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0

terminalizer:
	terminalizer render docs/terminalizer-shed.yml

build-debian:
	cd test && docker build . -f Dockerfiles/Dockerfile_debian -t shed-tester:debian -t siakhooi/shed-tester:debian
test-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:debian bash /working/test/in-container-init-test.sh
run-shed-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:debian bash

build-ubuntu:
	cd test && docker build . -f Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu -t siakhooi/shed-tester:ubuntu
test-ubuntu:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:ubuntu bash /working/test/in-container-init-test.sh
run-shed-ubuntu:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:ubuntu bash

init-test:
	. test/in-container-init-test.sh

init-terminalizer:
	. screenshots_src/in-container-setup.sh
prepare-environments:
	. /working/test/prepare-environments.sh
prepare-kind-clusters:
	. /working/test/prepare-kind-clusters.sh
teardown-kind-clusters:
	. /working/test/teardown-kind-clusters.sh

kill-kind-clusters:
	docker kill $$(docker ps -a --filter label=io.x-k8s.kind.cluster --format='{{ .Names }}')
	docker rm $$(docker ps -a --filter label=io.x-k8s.kind.cluster --format='{{ .Names }}')

test-steps:
# docker exec -it xxxxx bash
	shed-config-get
	shed-config-edit
	shed-value
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
