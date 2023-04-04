% SHED-KUBECONFIG-USE(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-kubeconfig-use - set the environment to use a KubeConfig.\
c0 - alias for **shed-kubeconfig-use 0**\
c1 - alias for **shed-kubeconfig-use 1**\
c2 - alias for **shed-kubeconfig-use 2**\
c3 - alias for **shed-kubeconfig-use 3**\
c4 - alias for **shed-kubeconfig-use 4**

# SYNOPSIS
**shed-kubeconfig-use** kubeconfig-number\
**c0**\
**c1**\
**c2**\
**c3**\
**c4**

# DESCRIPTION
Set the environment to use a KubeConfig.\
Optional by configuration (*.shed-kubeconfig-use.kubectl-switch-context*), **shed-kubeconfig-use** can also change the kubectl context together.

# EXAMPLES
**shed-kubeconfig-use** 1

**c0**

**c1**

# FILES
~/.shed/config.yaml
: shed config file

# ENVIRONMENT VARIABLES
SHED_CONFIG_FILE
: shed config file, default to $SHED_CONFIG_HOME/config.yaml

SHED_CODE
: the current Shed.

SHED_KUBECONFIG_NUMBER
: the number of current KubeConfig, set with this command.

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-config(1), shed-config-edit(1), shed-config.yaml(5), shed-use(1), shed-kubectl(1), shed-helm(1), shed-istioctl(1)
