# shed-kubectl-delete

Delete the resources based on resource located in directory set in environment variable `SHED_CONFIG_DIRECTORY_RESOURCES`.

## SYNOPSIS

```bash
shed-kubectl-delete kubectl-resource
shed kubectl-delete kubectl-resource
kd kubectl-resource
```

## EXAMPLES

```bash
$shed-kubectl-delete hello-world
+ kubectl -context kube-dev-1 delete -f /home/user1/.shed/kubectl-resources/hello-world
pod/hello-world deleted
```

## SEE ALSO

- [~/.shed/kubectl-resources](directory-kubectl-resources.md)
- [shed-kubectl-apply](shed-kubectl-apply.md)
- [shed-kubectl-resources](shed-kubectl-resources.md)
