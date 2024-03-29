info:

clean:
	rm -rf target *.deb *.deb.*sum test/actual-tests

prepare:
	. scripts/prepare-environments-in-codespace.sh

build:
	./scripts/shellcheck.sh
	./scripts/build.sh

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

build-debian:
	cd test && docker build . -f Dockerfiles/Dockerfile_debian -t shed-tester:debian -t siakhooi/shed-tester:debian
run-shed-debian:
	docker run -it --network host --rm -w /working -v $$(pwd):/working -v /var/run/docker.sock:/var/run/docker.sock siakhooi/shed-tester:debian bash

build-ubuntu:
	cd test && docker build . -f Dockerfiles/Dockerfile_ubuntu -t shed-tester:ubuntu -t siakhooi/shed-tester:ubuntu
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
