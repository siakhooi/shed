% SHED-HELM(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-helm - run helm with context and/or namespace from current KubeConfig.\
h - alias to shed-helm

# SYNOPSIS
**shed-helm** [helm arguments]\
**shed helm** [helm arguments]\
**h**  [helm arguments]

# DESCRIPTION
Run helm command with context and/or namespace from current KubeConfig.

# EXAMPLES
shed-use T; **shed-helm** list
: helm --kube-context kube-test-1  list

shed-use D; **shed-helm** list
: helm --kube-context kube-dev-1 --namespace ns-application list

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all kube config files in *~/.shed/kubectl-config*

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubeconfig-use(1), shed-kubectl(1), shed-istioctl(1)