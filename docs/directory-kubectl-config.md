# ~/.shed/kubectl-config

This directory contains kubectl config files that will be added to environment variable `KUBECONFIG` by `shed-init`.

## DESCRIPTION

User can separate all kubectl config files by clusters or Sheds, for better management. When `shed-init` is called on start up, the environment variable `KUBECONFIG`, which is used by `kubectl`, if it is not set, will be set to include $HOME/.kube/config and all files from this directory.

This behaviour can be turned of by set `.shed-init.load-kubectl-config` to `no` in the Shed config file.

## SEE ALSO

- [~/.shed/config.yaml](file-shed-config.yaml.md)
