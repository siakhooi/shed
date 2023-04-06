# Shed

## Introduction

Shed is a collection of bash scripts to manage kubernetes environments. If you work with several clusters/namespaces frequently, Shed is suitable to you.\
What is the meaning of **Shed**? In Kubernetes, _we treat resources as cattles, and cattles live in shed_.

Terminology:

Shed: Can be a cluster, a collection of clusters, a namespace or a collection of namespaces.\
KubeConfig: a combination or a kubectl context and/or namespace.

Features:

- Supports up to 5 KubeConfig per shed[📚](docs/file-shed-config.yaml.md).
- Able to work with different Shed[📚](docs/shed-use.md) and/or KubeConfig[📚](docs/shed-kubeconfig-use.md) in different shell sessions.
- Auto include kubectl config file into `KUBECONFIG` environment on start up [📚](docs/directory-kubectl-config.md).
- Modified shell prompt for better visibility of which Shed/KubeConfig the shell session is working on.
- Hooks to extends shed functionalities on:
  - shed-init [📚](docs/directory-init.d-shed-init.md) - when the shell session started.
  - shed-use [📚](docs/directory-init.d-shed-use.md)- when switch to different Shed using command `shed-use`[📚](docs/shed-use.md).
  - shed-kubeconfig-use [📚](docs/directory-init.d-shed-kubeconfig-use.md) - when switch to different KubeConfig using commands `shed-kubeconfig-use` [📚](docs/shed-kubeconfig-use.md), `c0`, `c1`, `c2`, `c3`, `c4`.
- Support `kubectl` with shortened alias, ie `k`[📚](docs/shed-kubectl.md).
- Support `helm` with shortened alias, ie `h`[📚](docs/shed-helm.md).
- Support `istioctl` with shortened alias, ie `i`[📚](docs/shed-istioctl.md).

Current Development Environment:

- Shed is currently developed in wsl ubuntu and tested with Ubuntu and Debian images.

## Documentation

- [Documentation](docs/documentation.md)

![shed-use-shed-kubectl](docs/shed-use-shed-kubectl.gif "shed-use-shed-kubectl")

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
- run `shed-config-edit`[📚](docs/shed-config-edit.md) to update the Shed config file. You can also use your favourite text editor to edit `~/.shed/config.yaml`[📚](docs/file-shed-config.yaml.md) directly.
- Optionally, put kubectl config files in `~/.shed/kubectl-config` [📚](docs/directory-kubectl-config.md), restart shell if you do this. You can skip this step if you have setup the kubectl configs.

## Using Shed

- you can then start using Shed:
  - start with `shed-use`[📚](docs/shed-use.md).
  - optionally `c0`[📚](docs/shed-kubeconfig-use.md), `c1`, etc.
  - then `k get po`[📚](docs/shed-kubectl.md), or `h list`[📚](docs/shed-helm.md), etc.

## Deployments

- <https://siakhooi.github.io/apt/>
- <https://siakhooi.jfrog.io/ui/packages>
