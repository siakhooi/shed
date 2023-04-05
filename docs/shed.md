# shed

Shed is a collection of bash scripts to manage kubernetes environments. If you work with several clusters/namespaces frequently, Shed is suitable to you.

shed is also a program that provides alternate way to run shed programs.

## SYNOPSIS

| command                                 | alternate way                        | alias                        |
| --------------------------------------- | ------------------------------------ | ---------------------------- |
| `shed-list`                             | `shed list`                          |                              |
| `shed-list-code`                        | `shed list-code`                     |                              |
| `shed-env`                              | `shed env`                           |                              |
| `shed-config`                           | `shed config`                        |                              |
| `shed-config-edit`                      | `shed config-edit`                   |                              |
| `shed-config-get` yamlPath              | `shed config-get` yamlPath           |                              |
| `shed-value` yamlPath                   | `shed value` yamlPath                |                              |
| `shed-values`                           | `shed values`                        |                              |
| `shed-kubectl` [kubectl arguments]      | `shed kubectl` [kubectl arguments]   | `k` [kubectl arguments]      |
| `shed-helm` [helm arguments]            | `shed helm` [helm arguments]         | `h` [helm arguments]         |
| `shed-istioctl` [istioctl arguments]    | `shed istioctl` [istioctl arguments] | `i` [istioctl arguments]     |
| `shed`                                  | `shed help`, `man shed`              |                              |
| `shed-use` shedCode                     |                                      |                              |
| `shed-kubeconfig-use` kubeconfig-number |                                      | `c0`, `c1`, `c2`, `c3`, `c4` |

## TERMINOLOGY

**Shed** - an environment, such as production, test, or development, etc. It can a cluster, a collection of clusters, a namespace or a collection of namespaces.

**KubeConfig** - a combination or a kubectl context and/or namespace.

## FILES AND DIRECTORIES

| Path                                  | Type | Description                                                                                   |
| ------------------------------------- | ---- | --------------------------------------------------------------------------------------------- |
| `~/.shed/config.yaml`                 | file | shed config file, default value of `SHED_CONFIG_FILE` environment variable.                   |
| `~/.shed/init.d/shed-init/`           | dir  | user defined scripts that will be executed when shed is initiated by `shed-init`              |
| `~/.shed/init.d/shed-use/`            | dir  | user defined scripts that will be executed when shed is set by `shed-use`.                    |
| `~/.shed/init.d/shed-kubeconfig-use/` | dir  | user defined scripts that will be executed when KubeConfig is set by `shed-kubeconfig-use`.   |
| `~/.shed/kubectl-config`              | dir  | kube config files that will be added to environment variable `$KUBECONFIG` on by `shed-init`. |

## ENVIRONMENT VARIABLES

| Name                     | Description                                                                                         |
| ------------------------ | --------------------------------------------------------------------------------------------------- |
| `SHED_CONFIG_HOME`       | Home directory for shed config files, default to `$HOME/.shed`                                      |
| `SHED_CONFIG_FILE`       | shed config file, default to `$SHED_CONFIG_HOME/config.yaml`                                        |
| `SHED_CODE`              | the current Shed.                                                                                   |
| `SHED_KUBECONFIG_NUMBER` | the current KubeConfig Number                                                                       |
| `EDITOR`                 | Text editor to edit config file, see `shed-config-edit`, default to `vi`.                           |
| `PS1`                    | shed-init will modified this shell prompt.                                                          |
| `KUBECONFIG`             | shed-init will load all files in `~/.shed/kubectl-config` directory into this environment variable. |

## SEE ALSO

[shed-env](shed-env.md)
[shed-list](shed-list.md), [shed-list-code](shed-list-code.md),
[shed-config](shed-config.md), [shed-config-edit](shed-config-edit.md), [shed-config-get](shed-config-get.md),
[shed-value](shed-value.md), [shed-values](shed-values.md),
[shed-use](shed-use.md), [shed-kubeconfig-use](shed-kubeconfig-use.md),
[shed-kubectl](shed-kubectl.md), [shed-helm](shed-helm.md), [shed-isioctl](shed-isioctl.md),
[~/.shed/config.yaml](file-shed-config.yaml.md),
[~/.shed/init.d/shed-init](directory-init.d-shed-init.md)
