% SHED-KUBECTL(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-kubectl - run kubectl with context and/or namespace from current KubeConfig.\
k - alias to shed-kubectl

# SYNOPSIS
**shed-kubectl** [kubectl arguments]\
**shed kubectl** [kubectl arguments]\
**k**  [kubectl arguments]

# DESCRIPTION
Run **kubectl** command with context and/or namespace from current KubeConfig.

# EXAMPLES
shed-use T; **shed-kubectl** get pods
: kubectl \-\-context kube-test-1 get pods

shed-use D; **shed-kubectl** get pods
: kubectl \-\-context kube-dev-1 \-\-namespace ns-application get pods

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all kube config files in *~/.shed/kubectl-config*

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-use(1), shed-kubeconfig-use(1), shed-helm(1), shed-istioctl(1)\
shed-kubectl-exec-sh(1), shed-kubectl-exec-bash(1)\
shed-kubectl-scale(1), shed-kubectl-resources(1), shed-kubectl-apply(1), shed-kubectl-delete(1)\
shed-kubectl-secret-decode(1)
