% SHED-ISTIOCTL(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-istioctl - run istioctl with context and/or namespace from current KubeConfig.\
i - alias to shed-istioctl

# SYNOPSIS
**shed-istioctl** [istioctl arguments]\
**shed istioctl** [istioctl arguments]\
**i**  [istioctl arguments]

# DESCRIPTION
Run istioctl command with context and/or namespace from current KubeConfig.

# EXAMPLES
shed-use T; **shed-istioctl** install
: istioctl \-\-context kube-test-1 install

shed-use D; **shed-istioctl** install
: istioctl \-\-context kube-dev-1 \-\-namespace ns-application install

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all kube config files in *~/.shed/kubectl-config*

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubeconfig-use(1), shed-kubectl(1), shed-helm(1)