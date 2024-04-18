% SHED-KUBECTL-LOGS-PREVIOUS(1) Siak Hooi DevUtils 1.1.0|Shed Commands
% Siak Hooi
% April 2024

# NAME
shed-kubectl-logs-previous - run **kubectl logs --previous** with context and/or namespace from current KubeConfig.\
k-logs-p - alias to shed-kubectl-logs-previous

# SYNOPSIS
**shed-kubectl-logs-previous** (pod | type/name) [container]\
**shed kubectl-logs-previous** (pod | type/name) [container]\
**k-logs-p** (pod | type/name) [container]

# DESCRIPTION
Run **kubectl logs** with previous flag (*--previous*) and *\-\-tail=0* in context and/or namespace from current KubeConfig.

# EXAMPLES
**shed-kubectl-logs-previous** pod/pod-abc
: kubectl \-\-context kube-test-1 logs \-\-previous pod/pod-abc

**shed-kubectl-logs-previous** pod/pod-abc container-1
: kubectl \-\-context kube-dev-1 \-\-namespace ns-application logs \-\-previous pod/pod-abc -c container-1

# ENVIRONMENT VARIABLES
KUBECONFIG
: contains paths to all KubeConfig files in ~/.shed/kubectl-config

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubectl-logs-follow(1), shed-kubeconfig-use(1), shed-kubectl(1)
