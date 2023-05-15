# shed-kubectl-exec-bash

Run **bash** in kubernetes resource via **kubectl exec** with context and/or namespace from current KubeConfig.

## SYNOPSIS

```bash
shed-kubectl-exec-bash (pod | type/name) [container]
shed kubectl-exec-bash (pod | type/name) [container]
k-bash (pod | type/name) [container]
```

## EXAMPLES

```bash
$ shed-use T; shed-kubectl-exec-bash pod/pod-abc
+ kubectl --context kube-test-1 exec -it pod/pod-abc -- bash
...

$ shed-use D; shed-kubectl-exec-bash pod/pod-abc
+ kubectl --context kube-dev-1 --namespace ns-application exec -it pod/pod-abc -- bash
...

$ shed-kubectl-exec-bash pod/pod-abc container-1
+ kubectl --context kube-dev-1 --namespace ns-application exec -it pod/pod-abc -c container-1 -- bash
...
```

## SCREENSHOTS

![shed-kubectl-exec-bash](shed-kubectl-exec-bash.gif "shed-kubectl-exec-bash")

## SEE ALSO

[shed-kubeconfig-use](shed-kubeconfig-use.md), [shed-kubectl](shed-kubectl.md), [shed-kubectl-exec-sh](shed-kubectl-exec-sh.md)
