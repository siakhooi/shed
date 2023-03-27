# Shed

## Introduction

Shed is a collection of bash scripts to manage kubernetes environments.

What is the meaning of Shed? In kubernetes, _we treat resources as cattles, and cattles lives in shed_.

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
- Support `kubectl` with shortened alias, ie `k`.
- Support `helm` with shortened alias, ie `h`.

Current Development Environment:

- Shed is currently developed in wsl ubuntu and tested with Ubuntu and Debian images.

## Commands

| Command                                 | Alias                        | Type     |
| --------------------------------------- | ---------------------------- | -------- |
| `shed-config`                           |                              | bin      |
| `shed-config-edit`                      |                              | bin      |
| `shed-config-get yamlPath`              |                              | bin      |
| `shed-env`                              |                              | bin      |
| `shed-list`                             |                              | bin      |
| `shed-list-code`                        |                              | bin      |
| `shed-value yamlPath`                   |                              | bin      |
| `shed-values`                           |                              | bin      |
| `shed-kubectl [kubectl arguments]`      | `k`                          | bin      |
| `shed-helm [helm arguments]`            | `h`                          | bin      |
| `shed-use shedCode`                     |                              | function |
| `shed-kubeconfig-use kubeconfig-number` | `c0`, `c1`, `c2`, `c3`, `c4` | function |

👉Visit [Screenshots](screenshots/Screenshots.md) of each commands.

## Installation

- Pre-requisite
  - yq <https://github.com/mikefarah/yq>
  - kubectl <https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/>
  - helm <https://helm.sh/docs/intro/install/> - optional, only if using helm feature.

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-shed
```

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>
