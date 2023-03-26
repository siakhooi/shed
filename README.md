# Shed

## Introduction

Shed is a collection of bash scripts to manage kubernetes environments.

What is the meaning of Shed? In kubernetes, *we treat resources as cattles, and cattles lives in shed*.

in Shed, a shed can be a cluster, a collection of clusters, a namespace or a collection of namespaces.

Features:

- Supports up to 5 kube config per shed. (kube config: a combination or a kube context and/or namespace).
- Able to work with different shed or kube config in different shell sessions.
- Auto include kubectl config into `KUBECONFIG` environment on start up.
- Modified shell prompt for better visibility of which shed/config the shell sessions is working on.
- Hooks to extends shed functionalities on:
  - shed-init - when the shell session started.
  - shed-use - when switch to different shed using command `shed-use`.
  - shed-kubeconfig-use - when switch to different kube config using commands `shed-kubeconfig-use`, `c0`, `c1`, `c2`, `c3`, `c4`.
- Support `kubectl` with shorten alias, such as `k`.

Current Development Environment:

- Shed is currently developed in wsl ubuntu and tested with Ubuntu and Debian images.

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

shed-kubectl [kubectl arguments]

shed-use shedCode
shed-kubeconfig-use kubeconfig-number
c0
c1
c2
c3
c4
k
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
