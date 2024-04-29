# shed-kubectl-secret-decode

Read secret, decode all data with base64 and print onto screen.

## SYNOPSIS

```bash
shed-kubectl-secret-decode secretName
shed kubectl-secret-decode secretName
k-secret-decode secretName
```

## EXAMPLES

```bash
$shed-kubectl-secret-decode mySecret
+ kubectl -context kube-dev-1 get secrets/mySecret -o yaml
[key1]
value 1

[key2]
value 
```

## SEE ALSO

[shed-kubectl](shed-kubectl.md)
