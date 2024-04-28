# shed-kubectl-apply

Apply the resources located in directory set in environment variable `SHED_CONFIG_DIRECTORY_RESOURCES`.

## SYNOPSIS

```bash
shed-kubectl-apply kubectl-resource
shed kubectl-apply kubectl-resource
ka kubectl-resource
```

## EXAMPLES

```bash
$shed-kubectl-apply hello-world
+ kubectl -context kube-dev-1 apply -f /home/user1/.shed/kubectl-resources/hello-world
pod/hello-world created
```

## SEE ALSO

[shed-kubectl-delete](shed-kubectl-delete.md), [shed-kubectl-resources](shed-kubectl-resources.md), [~/.shed/kubectl-resources](directory-kubectl-resources.md)
