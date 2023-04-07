shed-env:
	shed-env

shed-list-code:
	shed-list-code

shed-list:
	shed-list

shed-config:
	shed-config

shed-config-get:
	shed-config-get .shed-init.shed
	shed-config-get .sheds[0].code
	shed-config-get .sheds[0].name
	shed-config-get .sheds[1].code
	shed-config-get .sheds[1].name

shed-config-edit:
	shed-config-edit
	:q!

shed-values:
	shed-use T
	shed-values
	shed-use D
	shed-values

shed-value:
	shed-use T
	shed-value .code
	shed-value .name
	shed-use D
	shed-value .code
	shed-value .name

shed-value-key-list:
	shed-value-key-list

cluster-setup:
	docker pull kindest/node:v1.26.3
	docker pull siakhooi/starter-web:hello-world
	kind create cluster --name kube-dev-1 --image=kindest/node:v1.25.3 --kubeconfig ~/.shed/kubectl-config/kube-dev-1
	kind create cluster --name kube-test-1 --image=kindest/node:v1.25.3 --kubeconfig ~/.shed/kubectl-config/kube-test-1
	kind --name kube-dev-1 load docker-image siakhooi/starter-web:hello-world
	kind --name kube-test-1 load docker-image siakhooi/starter-web:hello-world
	kind --name kube-dev-1 load docker-image ubuntu
	shed-use D
	k create ns ns-application
	k create ns ns-database

cluster-tear-down:
	kind delete clusters kube-dev-1 kube-test-1

shed-kubectl-exec-sh:
#	setup
	shed-use D
	k run hello-dev-app-1 --image=siakhooi/starter-web:hello-world
#	run
	shed-use D
	k get po
	k-sh hello-dev-app-1
	hostname
	ps
	exit
	exit

shed-kubectl-exec-bash:
#	setup
	shed-use D
	k run hello-dev-app-1 --image=siakhooi/starter-web:hello-world
#	run
	shed-use D
	k get po
	k-bash hello-dev-app-1
	ps
	exit

shed-use-shed-kubectl:
## setup
	shed-use D
	k run hello-dev-app-1 --image=siakhooi/starter-web:hello-world
	k run hello-dev-app-2 --image=siakhooi/starter-web:hello-world
	c1
	k run hello-dev-db-3 --image=siakhooi/starter-web:hello-world

	shed-use T
	k run hello-test-app-1 --image=siakhooi/starter-web:hello-world
	k run hello-test-db-1 --image=siakhooi/starter-web:hello-world

## create shed-use, shed-kubectl
	shed-use D
	k get po
	c1
	k get po
	shed-use T
	k get po

## clean up
	shed-use D
	k delete po/hello-dev-app-1 po/hello-dev-app-2
	c1
	k delete po/hello-dev-db-3
	shed-use T
	k delete po/hello-test-app-1 po/hello-test-db-1

shed-kubeconfig-use-shed-kubectl:
## setup
	shed-use D
	k run hello-dev-app-1 --image=siakhooi/starter-web:hello-world
	k run hello-dev-app-2 --image=siakhooi/starter-web:hello-world
	c1
	k run hello-dev-db-3 --image=siakhooi/starter-web:hello-world

	shed-use T
	k run hello-test-app-1 --image=siakhooi/starter-web:hello-world
	k run hello-test-db-1 --image=siakhooi/starter-web:hello-world

## create shed-kubeconfig-use, shed-kubectl
	shed-use D
	k get po
	c1
	k get po
	c0
	k get po

## clean up
	shed-use D
	k delete po/hello-dev-app-1 po/hello-dev-app-2
	c1
	k delete po/hello-dev-db-3
	shed-use T
	k delete po/hello-test-app-1 po/hello-test-db-1

shed-helm:
## setup
	docker pull bitnami/mariadb:10.6.12-debian-11-r16
	docker pull bitnami/wordpress:6.2.0-debian-11-r1

	kind --name kube-test-1 load docker-image bitnami/mariadb:10.6.12-debian-11-r16
	kind --name kube-test-1 load docker-image bitnami/wordpress:6.2.0-debian-11-r1

	helm repo add bitnami https://charts.bitnami.com/bitnami
	h repo update

## run
	shed-use T
	h list
	k get po
	h install test-wp1 bitnami/wordpress
	h list
	k get po

