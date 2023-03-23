% SHED-CONFIG(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-config - print content of shed config file.

# SYNOPSIS
**shed-config**

# DESCRIPTION
Print content of shed config file.

# EXAMPLES
**shed-config**\
\ \ \ \  sheds:\
\ \ \ \ \ \ \ - code: D\
\ \ \ \ \ \ \ \ \ name: shed-D-development\
\ \ \ \ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \ \ \ \  - context: kube-dev-1\
\ \ \ \ \ \ \ \ \ \ \ \  namespace: ns-application\
\ \ \ \ \ \ \ \ \ \  - context: kube-dev-1\
\ \ \ \ \ \ \ \ \ \ \ \  namespace: ns-database\
\ \ \ \ \ \ \ - code: T\
\ \ \ \ \ \ \ \ \ name: shed-T-testing\
\ \ \ \ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \ \ \ \  - context: kube-test-1\
\ \ \ \ \ \ \ \ \ \  - context: kube-test-2\
\ \ \ \ \ \ \ \ \ \  - context: kube-test-3\
\ \ \ \ \ \ \ - code: P\
\ \ \ \ \ \ \ \ \ name: shed-P-production\
\ \ \ \ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \ \ \ \  - context: kube-prod-1\
\ \ \ \  init:\
\ \ \ \ \ \ \ shed: P

# EXIT CODE
**1**
: Environment variable SHED_CONFIG_FILE is not set.

**2**
: File stated in SHED_CONFIG_FILE does not exist.

# FILES
~/.shed/config.yaml
: shed config file

# ENVIRONMENT VARIABLES
SHED_CONFIG_FILE
: shed config file, default to $SHED_CONFIG_HOME/config.yaml

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-config-edit(1), shed-config.yaml(5), shed-config-get(1), shed(1)
