clean:
	rm -rf target *.deb *.deb.*sum

build:
	./build.sh

test-generate:
	pandoc src/md/shed-values.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-values.out
	pandoc src/md/shed-value-key-list.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-value-key-list.out
	pandoc src/md/shed-env.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-env.out
	pandoc src/md/shed-list.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-list.out
	pandoc src/md/shed-list-code.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-list-code.out
	pandoc src/md/shed-kubectl-scale.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-kubectl-scale.out
	pandoc src/md/shed-kubectl-logs-follow.1.md -s -t man|MANWIDTH=120 man --pager=cat -l - > test/expected/man_shed-kubectl-logs-follow.out

test-generate-in-container:
	shed-env > test/expected/shed-env.out
	shed env > test/expected/shed_env.out
	shed-values > test/expected/shed-values.out
	shed values > test/expected/shed_values.out
	shed-value-key-list > test/expected/shed-value-key-list.out
	shed value-key-list > test/expected/shed_value-key-list.out
	shed-list > test/expected/shed-list.out
	shed list > test/expected/shed_list.out
	shed-list-code > test/expected/shed-list-code.out
	shed list-code > test/expected/shed_list-code.out

test-man:
	pandoc src/md/shed-kubectl-exec-sh.1.md -s -t man | man -l -
	pandoc src/md/shed-kubectl-exec-bash.1.md -s -t man | man -l -
#	pandoc src/md/shed-value-key-list.1.md -s -t man | man -l -
#	pandoc src/md/shed-config-edit.1.md -s -t man | man -l -
#	pandoc src/md/shed-config-get.1.md -s -t man | man -l -
#	pandoc src/md/shed-config.1.md -s -t man | man -l -
#	pandoc src/md/shed-env.1.md -s -t man | man -l -
#	pandoc src/md/shed-list-code.1.md -s -t man | man -l -
#	pandoc src/md/shed-list.1.md -s -t man | man -l -
#	pandoc src/md/shed.1.md -s -t man | man -l -
#	pandoc src/md/shed-kubectl.1.md -s -t man | man -l -
#	pandoc src/md/shed-kubeconfig-use.1.md -s -t man | man -l -
test-man-5:
	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0

install:
	sudo apt install -f ./siakhooi-shed_1.0.0_amd64.deb
uninstall:
	sudo apt remove -y siakhooi-shed
terminalizer:
	terminalizer render docs/terminalizer-shed.yml

test:
	run-ubuntu
	run-debian

run-in-container:
#	. in-container-init.sh
# . run-test.sh

test-steps:
# docker exec -it xxxxx bash
	shed-env
	shed-config
	shed-config-get
	shed-config-edit
	shed-list
	shed-list-code
	shed-values
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

	man shed-env
	man shed-config
	man shed-config-get
	man shed-config-edit
	man shed-list
	man shed-list-code
	man shed-values
	man shed-value
	man shed-use
	man shed
	man shed-kubeconfig-use
	man shed-kubectl
	man shed-helm
	man shed-istioctl
	
	completion kubectl, k, shed-kubectl
	completion helm, h, shed-helm
	completion istioctl, i, shed-istioctl
