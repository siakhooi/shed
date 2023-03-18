clean:
	rm -rf target *.deb

build:
	./build.sh

test-man-all:
	pandoc src/md/shed-config-edit.1.md -s -t man | man -l -
	pandoc src/md/shed-config-get.1.md -s -t man | man -l -
	pandoc src/md/shed-config.1.md -s -t man | man -l -
	pandoc src/md/shed-config.yaml.5.md -s -t man | man -l -
	pandoc src/md/shed-env.1.md -s -t man | man -l -
	pandoc src/md/shed-list-code.1.md -s -t man | man -l -
	pandoc src/md/shed-list.1.md -s -t man | man -l -
	pandoc src/md/shed.1.md -s -t man | man -l -

delete-tags:
	git tag --delete 1.0.0
	git push --delete origin 1.0.0

install:
	sudo apt install -f ./siakhooi-shed_1.0.0_amd64.deb
uninstall:
	sudo apt remove -y siakhooi-shed
terminalizer:
	terminalizer render docs/terminalizer-shed.yml

docker-ubuntu-bash:
	docker run --rm -it -w /working -v $$(pwd):/working ubuntu bash
#	. in-container-init.sh

docker-debian-bash:
	docker run --rm -it -w /working -v $$(pwd):/working debian bash
#	. in-container-init.sh
