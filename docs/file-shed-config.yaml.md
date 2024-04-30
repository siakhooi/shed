# ~/.shed/config.yaml

Shed config file

## DESCRIPTION

Shed config file is in yaml format, with following available options:

| Field                        | Type    | Default | Description                                                                       |
| ---------------------------- | ------- | ------- | --------------------------------------------------------------------------------- |
| `sheds[]`                    | array   |         | Sheds                                                                             |
| `  + code`                   | text    |         | ShedCode                                                                          |
| `  + name`                   | text    |         | Shed Name                                                                         |
| `  + kubeconfig[0..4]`       | array   |         | KubeConfigs, support up to 5 KubeConfig per Shed                                  |
| `    + context`              | text    |         | kubectl context of KubeConfig                                                     |
| `    + namespace`            | text    |         | optional, namespace of KubeConfig                                                 |
| `    + prompt-name`          | text    |         | optional, name to be display in prompt                                            |
| `shed-init`                  | object  |         |                                                                                   |
| `  + shed`                   | text    |         | ShedCode to use when session started                                              |
| `  + load-kubectl-config`    | boolean | `yes`   | update environment variable `KUBECONFIG` with files in `~/.shed/kubectl-config/`. |
| `shed-kubeconfig-use`        | object  |         | configuration related when switch KubeConfig                                      |
| `  + kubectl-switch-context` | boolean | `no`    | switch kubectl context on `shed-kubeconfig-use`, using `kubectl use-context`.     |

## Example

```yaml
sheds:
  - code: D
    name: shed-D-development
    kubeconfig:
      - context: kube-dev-1
        namespace: ns-application
        prompt-name: dev-app
      - context: kube-dev-1
        namespace: ns-database
  - code: T
    name: shed-T-testing
    kubeconfig:
      - context: kube-test-1
      - context: kube-test-2
      - context: kube-test-3
  - code: P
    name: shed-P-production
    kubeconfig:
      - context: kube-prod-1
shed-init:
  shed: P
  load-kubectl-config: no
shed-kubeconfig-use:
  kubectl-switch-context: yes
```

## SEE ALSO

- [shed-config-edit](shed-config-edit.md)
- [shed-config-get](shed-config-get.md)
- [shed-config](shed-config.md)
- [shed](shed.md)
- [~/.shed/init.d/shed-init](directory-init.d-shed-init.md)
- [~/.shed/init.d/shed-use](directory-init.d-shed-use.md)
- [~/.shed/init.d/shed-kubeconfig-use](directory-init.d-shed-kubeconfig-use.md)
- [~/.shed/kubectl-config](directory-kubectl-config.md)
