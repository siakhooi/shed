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

cluster-setup:
	docker pull kindest/node:v1.26.3 siakhooi/starter-web:hello-world
	kind create cluster --name kube-dev-1 --image=kindest/node:v1.25.3 --kubeconfig ~/.shed/kubectl-config/kube-dev-1
	kind create cluster --name kube-test-1 --image=kindest/node:v1.25.3 --kubeconfig ~/.shed/kubectl-config/kube-test-1
	kind --name kube-dev-1 load docker-image siakhooi/starter-web:hello-world
	kind --name kube-test-1 load docker-image siakhooi/starter-web:hello-world
	shed-use D
	k create ns ns-application
	k create ns ns-database

cluster-tear-down:
	kind delete clusters kube-dev-1 kube-test-1

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

