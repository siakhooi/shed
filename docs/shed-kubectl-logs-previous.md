# shed-kubectl-logs-previous

Run **kubectl logs** with previous flag (`--previous`) in context and/or namespace from current KubeConfig.

## SYNOPSIS

```bash
shed-kubectl-logs-previous (pod | type/name) [container]
shed kubectl-logs-previous (pod | type/name) [container]
k-logs-p (pod | type/name) [container]
```

## EXAMPLES

```bash
$ shed-use T; shed-kubectl-logs-previous pod/pod-abc
+ kubectl --context kube-test-1 logs --previous pod/pod-abc
...

$ shed-use D; shed-kubectl-logs-previous pod/pod-abc container-1
+ kubectl --context kube-dev-1 --namespace ns-application logs --previous pod/pod-abc -c container-1
...
```

## SEE ALSO

- [shed-kubeconfig-use](shed-kubeconfig-use.md)
- [shed-kubectl](shed-kubectl.md)
- [shed-kubectl-logs-follow](shed-kubectl-logs-follow.md)
