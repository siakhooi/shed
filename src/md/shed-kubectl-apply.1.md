% SHED-KUBECTL-APPLY(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% April 2024

# NAME
shed-kubectl-apply - apply the resources located in directory set in environment variable\
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ SHED_CONFIG_DIRECTORY_RESOURCES.\
ka - alias to shed-kubectl-apply

# SYNOPSIS
**shed-kubectl-apply** kubectl-resource\
**shed kubectl-apply** kubectl-resource\
**ka** kubectl-resource

# DESCRIPTION
Apply the resources located in directory set in environment variable SHED_CONFIG_DIRECTORY_RESOURCES.

# EXAMPLES
**shed-kubectl-apply** hello-world\
\ \ \ \  + kubectl --context kube-dev-1 apply -f /home/user1/.shed/kubectl-resources/hello-world\
\ \ \ \  pod/hello-world created

# FILES
~/.shed/kubectl-resources
: directory contains the resources

# ENVIRONMENT VARIABLES
SHED_CONFIG_DIRECTORY_RESOURCES
:  kubectl resources for **shed-kubectl-apply** and **shed-kubectl-delete**.

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubectl-resources(1),shed-kubectl-delete(1)
