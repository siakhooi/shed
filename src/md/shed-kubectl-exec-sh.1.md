% SHED-KUBECTL-EXEC-SH(1) Siak Hooi DevUtils 1.1.0|Shed Commands
% Siak Hooi
% April 2023

# NAME
shed-kubectl-exec-sh - run **sh** in kubernetes resource via **kubectl exec** with context and/or namespace from current KubeConfig.\
k-sh - alias to shed-kubectl-exec-sh

# SYNOPSIS
**shed-kubectl-exec-sh** (pod | type/name) [container]\
**shed kubectl-exec-sh** (pod | type/name) [container]\
**k-sh** (pod | type/name) [container]

# DESCRIPTION
Run **sh** in kubernetes resource via **kubectl exec** with context and/or namespace from current KubeConfig.

# EXAMPLES
shed-use T; **shed-kubectl-exec-sh** pod/pod-abc
: kubectl \-\-context kube-test-1 exec -it pod/pod-abc \-\- sh

shed-use D; **shed-kubectl-exec-sh** pod/pod-abc
: kubectl \-\-context kube-dev-1 \-\-namespace ns-application exec -it pod/pod-abc \-\- sh

**shed-kubectl-exec-sh** pod/pod-abc container-1
: kubectl \-\-context kube-dev-1 \-\-namespace ns-application exec -it pod/pod-abc -c container-1 \-\- sh

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all KubeConfig files in ~/.shed/kubectl-config

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubeconfig-use(1), shed-kubectl(1), shed-kubectl-exec-bash(1)
