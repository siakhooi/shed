# Shed

## Introduction

Shed is a collection of bash scripts to manage kubernetes environments. If you work with several clusters/namespaces frequently, Shed is suitable to you.\
What is the meaning of **Shed**? In Kubernetes, _we treat resources as cattles, and cattles live in shed_.

Terminology:

Shed: Can be a cluster, a collection of clusters, a namespace or a collection of namespaces.\
KubeConfig: a combination or a kubectl context and/or namespace.

Features:

- Supports up to 5 KubeConfig per shed.
- Able to work with different Shed and/or KubeConfig in different shell sessions.
- Auto include kubectl config file into `KUBECONFIG` environment on start up.
- Modified shell prompt for better visibility of which Shed/KubeConfig the shell session is working on.
- Hooks to extends shed functionalities on:
  - shed-init - when the shell session started.
  - shed-use - when switch to different Shed using command `shed-use`.
  - shed-kubeconfig-use - when switch to different KubeConfig using commands `shed-kubeconfig-use`, `c0`, `c1`, `c2`, `c3`, `c4`.
- Support `kubectl` with shortened alias, ie `k`.
- Support `helm` with shortened alias, ie `h`.
- Support `istioctl` with shortened alias, ie `i`.

Current Development Environment:

- Shed is currently developed in wsl ubuntu and tested with Ubuntu and Debian images.

## Commands

| Command                                 | Alias                        | Type     | Manpage | Docs                               |
| --------------------------------------- | ---------------------------- | -------- | ------- | ---------------------------------- |
| `shed-config`                           |                              | bin      | ✅      | [📚 Doc](docs/shed-config.md)      |
| `shed-config-edit`                      |                              | bin      | ✅      | [📚 Doc](docs/shed-config-edit.md) |
| `shed-config-get` yamlPath              |                              | bin      | ✅      | [📚 Doc](docs/shed-config-get.md)  |
| `shed-env`                              |                              | bin      | ✅      | [📚 Doc](docs/shed-env.md)         |
| `shed-list`                             |                              | bin      | ✅      | [📚 Doc](docs/shed-list.md)        |
| `shed-list-code`                        |                              | bin      | ✅      | [📚 Doc](docs/shed-list-code.md)   |
| `shed-values`                           |                              | bin      | ✅      | [📚 Doc](docs/shed-values.md)      |
| `shed-value` yamlPath                   |                              | bin      | ✅      | [📚 Doc](docs/shed-value.md)       |
| `shed-kubectl` [kubectl arguments]      | `k`                          | bin      | ✅      |                                    |
| `shed-helm` [helm arguments]            | `h`                          | bin      | ✅      |                                    |
| `shed-istioctl` [istioctl arguments]    | `i`                          | bin      | ✅      |                                    |
| `shed-use` shedCode                     |                              | function | ✅      |                                    |
| `shed-kubeconfig-use` kubeconfig-number | `c0`, `c1`, `c2`, `c3`, `c4` | function | ✅      |                                    |
| `shed`                                  |                              | bin      | ✅      |                                    |

## Files and Directories

| Path                                  | Type      | Manpage |
| ------------------------------------- | --------- | ------- |
| `~/.shed/config.yaml`                 | file      | ✅      |
| `~/.shed/init.d/shed-init/`           | directory | ❌      |
| `~/.shed/init.d/shed-use/`            | directory | ❌      |
| `~/.shed/init.d/shed-kubeconfig-use/` | directory | ❌      |
| `~/.shed/kubectl-config`              | directory | ❌      |

## Quick Start

### Pre-requisite

- yq <https://github.com/mikefarah/yq>
- kubectl <https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/>
- helm <https://helm.sh/docs/intro/install/> - optional.
- istioctl <https://istio.io/latest/docs/setup/getting-started/> - optional.

### Installation

```bash
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
$ sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
$ sudo apt update
$ sudo apt install siakhooi-shed

$ echo 'source /usr/lib/shed/shed-init' >> ~/.bashrc
```

### Initial Setup

- restart shell session.
- run `shed-config-edit`[📚](docs/shed-config-edit.md) to update the config file. You can also use your favourite text editor to edit `~/.shed/config.yaml` directly.
- Optionally, put kubectl config files in `~/.shed/kubectl-config`, restart shell if you do this. You can skip this step if you have setup the kubectl configs.

## Using Shed

- you can then start using Shed:
  - start with `shed-use`.
  - optionally `c0`, `c1`, etc.
  - then `k get po`, or `h list`, etc.

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>
