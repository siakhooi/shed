# shed-istioctl

Run istioctl command with context and/or namespace from current KubeConfig.

## SYNOPSIS

```bash
shed-istioctl [istioctl arguments]
shed istioctl [istioctl arguments]
i [istioctl arguments]
```

## DESCRIPTION

shed-istioctl - run istioctl with context and/or namespace from current KubeConfig.\
i - alias to shed-istioctl

## EXAMPLES

```bash
$ shed-use T; shed-istioctl install
+ istioctl --context kube-test-1 install
...

$ shed-use D; shed-istioctl install
+ istioctl --context kube-dev-1 --namespace ns-application install
...
```

## SEE ALSO

- [shed-config](shed-config.md)
- [shed-helm](shed-helm.md)
- [shed-kubeconfig-use](shed-kubeconfig-use.md)
- [shed-kubectl](shed-kubectl.md)
- [shed-use](shed-use.md)
