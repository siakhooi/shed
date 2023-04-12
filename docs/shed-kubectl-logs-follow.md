# shed-kubectl-logs-follow

Run **kubectl logs** with follow flag (`-f`) and `--tail=0` in context and/or namespace from current KubeConfig.

## SYNOPSIS

**shed-kubectl-logs-follow** (pod | type/name) [container]\
**shed kubectl-logs-follow** (pod | type/name) [container]\
**k-logs-f** (pod | type/name) [container]

## EXAMPLES

```bash
$ shed-use T; shed-kubectl-logs-follow pod/pod-abc
+ kubectl --context kube-test-1 logs -f --tail=0 pod/pod-abc
...

$ shed-use D; shed-kubectl-logs-follow pod/pod-abc container-1
+ kubectl --context kube-dev-1 --namespace ns-application logs -f --tail=0 pod/pod-abc -c container-1
...
```

## SEE ALSO

[shed-kubeconfig-use](shed-kubeconfig-use.md), [shed-kubectl](shed-kubectl.md)
