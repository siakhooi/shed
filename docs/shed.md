# shed

Shed is a collection of bash scripts to manage kubernetes environments. If you work with several clusters/namespaces frequently, Shed is suitable to you.

shed is a program that provides alternate way to run shed programs.

## TERMINOLOGY

**Shed** - an environment, such as production, test, or development, etc. It can a cluster, a collection of clusters, a namespace or a collection of namespaces.

**KubeConfig** - a combination or a kubectl context and/or namespace.

## SYNOPSIS

| command                                                     | alternate way                        | alias                        | Doc                                    |
| ----------------------------------------------------------- | ------------------------------------ | ---------------------------- | -------------------------------------- |
| `shed`                                                      | `shed help`, `man shed`              |                              | (This doc)                             |
| `shed-config`                                               | `shed config`                        |                              | [📚 Doc](shed-config.md)                |
| `shed-config-edit`                                          | `shed config-edit`                   |                              | [📚 Doc](shed-config-edit.md)           |
| `shed-config-get` yamlPath                                  | `shed config-get` yamlPath           |                              | [📚 Doc](shed-config-get.md)            |
| `shed-contexts`                                             | `shed contexts`                      | `sc`                         | [📚 Doc](shed-contexts.md)              |
| `shed-env`                                                  | `shed env`                           |                              | [📚 Doc](shed-env.md)                   |
| `shed-helm` [helm arguments]                                | `shed helm` [helm arguments]         | `h` [helm arguments]         | [📚 Doc](shed-helm.md)                  |
| `shed-kubeconfig-use` kubeconfig-number                     |                                      | `c0` - `c9`                  | [📚 Doc](shed-kubeconfig-use.md)        |
| `shed-kubectl` [kubectl arguments]                          | `shed kubectl` [kubectl arguments]   | `k` [kubectl arguments]      | [📚 Doc](shed-kubectl.md)               |
| `shed-kubectl-apply` kubectl-resource                       | `shed kubectl-apply` [...]           | `ka` [...]                   | [📚 Doc](shed-kubectl-apply.md)         |
| `shed-kubectl-delete` kubectl-resource                      | `shed kubectl-delete` [...]          | `kd` [...]                   | [📚 Doc](shed-kubectl-delete.md)        |
| `shed-kubectl-exec-bash` (pod \| type/name) [container]     | `shed kubectl-exec-bash` [...]       | `k-bash` [...]               | [📚 Doc](shed-kubectl-exec-bash.md)     |
| `shed-kubectl-exec-sh` (pod \| type/name) [container]       | `shed kubectl-exec-sh` [...]         | `k-sh` [...]                 | [📚 Doc](shed-kubectl-exec-sh.md)       |
| `shed-kubectl-logs-follow` (pod \| type/name) [container]   | `shed kubectl-logs-follow` [...]     | `k-logs-f` [...]             | [📚 Doc](shed-kubectl-logs-follow.md)   |
| `shed-kubectl-logs-previous` (pod \| type/name) [container] | `shed kubectl-logs-previous` [...]   | `k-logs-p` [...]             | [📚 Doc](shed-kubectl-logs-previous.md) |
| `shed-kubectl-resources`                                    | `shed kubectl-resources`             |                              | [📚 Doc](shed-kubectl-resources.md)     |
| `shed-kubectl-scale` replicas resourceName                  | `shed-kubectl-scale` [...]           | `k-scale` [...]              | [📚 Doc](shed-kubectl-scale.md)         |
| `shed-kubectl-secret-decode` secretName                     | `shed-kubectl-secret-decode` [...]   | `k-secret-decode` [...]      | [📚 Doc](shed-kubectl-secret-decode.md) |
| `shed-list`                                                 | `shed list`                          |                              | [📚 Doc](shed-list.md)                  |
| `shed-list-code`                                            | `shed list-code`                     |                              | [📚 Doc](shed-list-code.md)             |
| `shed-use` shedCode                                         |                                      |                              | [📚 Doc](shed-use.md)                   |
| `shed-value` yamlPath                                       | `shed value` yamlPath                |                              | [📚 Doc](shed-value.md)                 |
| `shed-value-key-list`                                       | `shed value-key-list`                |                              | [📚 Doc](shed-value-key-list.md)        |
| `shed-values`                                               | `shed values`                        |                              | [📚 Doc](shed-values.md)                |
| `shed-version`                                              | `shed version`                       |                              | [📚 Doc](shed-version.md)               |
