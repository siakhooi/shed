# shed-kubectl-scale

Run **kubectl scale** with the given resource and replicas in the context and/or namespace from current KubeConfig.

## SYNOPSIS

```bash
shed-kubectl-scale  replicas resourceName
shed kubectl-scale  replicas resourceName
k-scale  replicas resourceName
```

## EXAMPLES

```bash
$ shed-kubectl-scale 5 pod-abc
kubectl --context kube-test-1 scale --replicas=5 pod-abc
...

$ shed-kubectl-scale 5 sts/maria-database-abc
kubectl --context kube-test-1 scale --replicas=5 sts/maria-database-abc
...
```

## SEE ALSO

[shed-kubeconfig-use](shed-kubeconfig-use.md), [shed-kubectl](shed-kubectl.md)
