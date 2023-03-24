# Shed

## Introduction

Shed is a collection of bash scripts to manage k8s environments.

What is the meaning of shed? In kubernetes, we treat resources as cattles, and cattles lives in shed.

in Shed, a shed can be a cluster, a collection of clusters, a namespace or a collection of namespace.

Features:

- A shed comprises of up to 5 kube config, which is a combination or a kube context and/or namespace.
- Shed uses environment variable to control which kubectl context and namespace to work on.
- Auto include kubectl config into KUBECONFIG environment on start up.

## Commands

```bash
shed-config
shed-config-edit
shed-config-get yamlPath

shed-env

shed-list
shed-list-code

shed-value yamlPath
shed-values

shed-use shedCode
shed-kubeconfig-use kubeconfig-number
c0
c1
c2
c3
c4
```

👉Visit [Screenshots](screenshots/Screenshots.md) of each commands.

## Installation

- Pre-requisite
  - yq <https://github.com/mikefarah/yq>

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-shed
```

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>
