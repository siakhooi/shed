# DOCUMENTATION

## COMMANDS

| Command                                                 | Alias                        | Type     | Manpage | Docs                                |
| ------------------------------------------------------- | ---------------------------- | -------- | ------- | ----------------------------------- |
| `shed-config`                                           |                              | bin      | ✅      | [📚 Doc](shed-config.md)            |
| `shed-config-edit`                                      |                              | bin      | ✅      | [📚 Doc](shed-config-edit.md)       |
| `shed-config-get` yamlPath                              |                              | bin      | ✅      | [📚 Doc](shed-config-get.md)        |
| `shed-env`                                              |                              | bin      | ✅      | [📚 Doc](shed-env.md)               |
| `shed-list`                                             |                              | bin      | ✅      | [📚 Doc](shed-list.md)              |
| `shed-list-code`                                        |                              | bin      | ✅      | [📚 Doc](shed-list-code.md)         |
| `shed-values`                                           |                              | bin      | ✅      | [📚 Doc](shed-values.md)            |
| `shed-value-key-list`                                   |                              | bin      | ✅      | [📚 Doc](shed-value-key-list.md)    |
| `shed-value` yamlPath                                   |                              | bin      | ✅      | [📚 Doc](shed-value.md)             |
| `shed-kubectl` [kubectl arguments]                      | `k`                          | bin      | ✅      | [📚 Doc](shed-kubectl.md)           |
| `shed-kubectl-exec-sh` (pod \| type/name) [container]   | `k-sh`                       | bin      | ✅      | [📚 Doc](shed-kubectl-exec-sh.md)   |
| `shed-kubectl-exec-bash` (pod \| type/name) [container] | `k-bash`                     | bin      | ✅      | [📚 Doc](shed-kubectl-exec-bash.md) |
| `shed-helm` [helm arguments]                            | `h`                          | bin      | ✅      | [📚 Doc](shed-helm.md)              |
| `shed-istioctl` [istioctl arguments]                    | `i`                          | bin      | ✅      | [📚 Doc](shed-istioctl.md)          |
| `shed-use` shedCode                                     |                              | function | ✅      | [📚 Doc](shed-use.md)               |
| `shed-kubeconfig-use` kubeconfig-number                 | `c0`, `c1`, `c2`, `c3`, `c4` | function | ✅      | [📚 Doc](shed-kubeconfig-use.md)    |
| `shed`                                                  |                              | bin      | ✅      | [📚 Doc](shed.md)                   |

## FILES AND DIRECTORIES

| Path                                  | Type      | Manpage | Docs                                              | Description                                                                                      |
| ------------------------------------- | --------- | ------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `~/.shed/config.yaml`                 | file      | ✅      | [📚 Doc](file-shed-config.yaml.md)                | shed config file, default value of `SHED_CONFIG_FILE` environment variable.                      |
| `~/.shed/init.d/shed-init/`           | directory | ❌      | [📚 Doc](directory-init.d-shed-init.md)           | user defined scripts that will be executed when shed is initiated by `shed-init`                 |
| `~/.shed/init.d/shed-use/`            | directory | ❌      | [📚 Doc](directory-init.d-shed-use.md)            | user defined scripts that will be executed when shed is set by `shed-use`.                       |
| `~/.shed/init.d/shed-kubeconfig-use/` | directory | ❌      | [📚 Doc](directory-init.d-shed-kubeconfig-use.md) | user defined scripts that will be executed when KubeConfig is set by `shed-kubeconfig-use`.      |
| `~/.shed/kubectl-config`              | directory | ❌      | [📚 Doc](directory-kubectl-config.md)             | kubectl config files that will be added to environment variable `$KUBECONFIG` on by `shed-init`. |

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
