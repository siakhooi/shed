% SHED-KUBECTL-SCALE(1) Siak Hooi DevUtils 1.1.0|Shed Commands
% Siak Hooi
% April 2023

# NAME
shed-kubectl-scale - run **kubectl scale** with the given resource and replicas in the context and/or namespace from current KubeConfig.\
k-scale - alias to shed-kubectl-scale

# SYNOPSIS
**shed-kubectl-scale**  replicas resourceName\
**shed kubectl-scale**  replicas resourceName\
**k-scale**  replicas resourceName

# DESCRIPTION
Run **kubectl scale** with the given resource and replicas in the context and/or namespace from current KubeConfig.

# EXAMPLES
**shed-kubectl-scale** 5 pod-abc
: kubectl --context kube-test-1 scale --replicas=5 pod-abc

**shed-kubectl-scale** 5 sts/maria-database-abc
: kubectl --context kube-test-1 scale --replicas=5 sts/maria-database-abc

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all KubeConfig files in ~/.shed/kubectl-config

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubeconfig-use(1), shed-kubectl(1)
