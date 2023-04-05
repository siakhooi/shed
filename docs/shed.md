# shed

Shed is a collection of bash scripts to manage kubernetes environments. If you work with several clusters/namespaces frequently, Shed is suitable to you.

shed is a program that provides alternate way to run shed programs.

## TERMINOLOGY

**Shed** - an environment, such as production, test, or development, etc. It can a cluster, a collection of clusters, a namespace or a collection of namespaces.

**KubeConfig** - a combination or a kubectl context and/or namespace.

## SYNOPSIS

| command                                 | alternate way                        | alias                        | Doc                              |
| --------------------------------------- | ------------------------------------ | ---------------------------- | -------------------------------- |
| `shed-list`                             | `shed list`                          |                              | [📚 Doc](shed-list.md)           |
| `shed-list-code`                        | `shed list-code`                     |                              | [📚 Doc](shed-list-code.md)      |
| `shed-env`                              | `shed env`                           |                              | [📚 Doc](shed-env.md)            |
| `shed-config`                           | `shed config`                        |                              | [📚 Doc](shed-config.md)         |
| `shed-config-edit`                      | `shed config-edit`                   |                              | [📚 Doc](shed-config-edit.md)    |
| `shed-config-get` yamlPath              | `shed config-get` yamlPath           |                              | [📚 Doc](shed-config-get.md)     |
| `shed-value` yamlPath                   | `shed value` yamlPath                |                              | [📚 Doc](shed-value.md)          |
| `shed-values`                           | `shed values`                        |                              | [📚 Doc](shed-values.md)         |
| `shed-kubectl` [kubectl arguments]      | `shed kubectl` [kubectl arguments]   | `k` [kubectl arguments]      | [📚 Doc](shed-kubectl.md)        |
| `shed-helm` [helm arguments]            | `shed helm` [helm arguments]         | `h` [helm arguments]         | [📚 Doc](shed-helm.md)           |
| `shed-istioctl` [istioctl arguments]    | `shed istioctl` [istioctl arguments] | `i` [istioctl arguments]     | [📚 Doc](shed-istioctl.md)       |
| `shed`                                  | `shed help`, `man shed`              |                              | (This doc)                       |
| `shed-use` shedCode                     |                                      |                              | [📚 Doc](shed-use.md)            |
| `shed-kubeconfig-use` kubeconfig-number |                                      | `c0`, `c1`, `c2`, `c3`, `c4` | [📚 Doc](shed-kubeconfig-use.md) |

## FILES AND DIRECTORIES

| Path                                  | Type | Description                                                                                      | Doc                                               |
| ------------------------------------- | ---- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| `~/.shed/config.yaml`                 | file | shed config file, default value of `SHED_CONFIG_FILE` environment variable.                      | [📚 Doc](file-shed-config.yaml.md)                |
| `~/.shed/init.d/shed-init/`           | dir  | user defined scripts that will be executed when shed is initiated by `shed-init`                 | [📚 Doc](directory-init.d-shed-init.md)           |
| `~/.shed/init.d/shed-use/`            | dir  | user defined scripts that will be executed when shed is set by `shed-use`.                       | [📚 Doc](directory-init.d-shed-use.md)            |
| `~/.shed/init.d/shed-kubeconfig-use/` | dir  | user defined scripts that will be executed when KubeConfig is set by `shed-kubeconfig-use`.      | [📚 Doc](directory-init.d-shed-kubeconfig-use.md) |
| `~/.shed/kubectl-config`              | dir  | kubectl config files that will be added to environment variable `$KUBECONFIG` on by `shed-init`. | [📚 Doc](directory-kubectl-config.md)             |

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
