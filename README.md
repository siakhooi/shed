# Shed

## Introduction

Shed is a collection of bash scripts to manage k8s environments.

What is the meaning of shed? In kubernetes, we treat resources as cattles, and cattles lives in shed.

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
