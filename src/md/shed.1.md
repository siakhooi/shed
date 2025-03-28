% SHED(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed is a collection of several bash scripts to manage Kubernetes clusters.

# SYNOPSIS
**shed config**\
**shed config-edit**\
**shed config-get** yamlPath\
**shed contexts**\
**shed env**\
**shed helm** [helm arguments]\
**shed help**\
**shed kubectl** [kubectl arguments]\
**shed kubectl-apply** kubectl-resource\
**shed kubectl-delete** kubectl-resource\
**shed kubectl-exec-bash**  (pod \| type/name) [container]\
**shed kubectl-exec-sh**  (pod \| type/name) [container]\
**shed kubectl-logs-follow** (pod \| type/name) [container]\
**shed kubectl-logs-previous** (pod \| type/name) [container]\
**shed kubectl-scale**  replicas resourceName\
**shed kubectl-secret-decode** secretName\
**shed list**\
**shed list-code**\
**shed value** yamlPath\
**shed value-key-list**\
**shed values**\
**shed version**\
\ \
**shed-aliases**\
**shed-config**\
**shed-config-edit**\
**shed-config-get** yamlPath\
**shed-contexts**\
**shed-env**\
**shed-helm** [helm arguments]\
**shed-kubectl** [kubectl arguments]\
**shed-kubectl-apply** kubectl-resource\
**shed-kubectl-delete** kubectl-resource\
**shed-kubectl-exec-bash**  (pod \| type/name) [container]\
**shed-kubectl-exec-sh**  (pod \| type/name) [container]\
**shed-kubectl-logs-follow** (pod \| type/name) [container]\
**shed-kubectl-logs-previous** (pod \| type/name) [container]\
**shed-kubectl-scale**  replicas resourceName\
**shed-kubectl-secret-decode** secretName\
**shed-list**\
**shed-list-code**\
**shed-value** yamlPath\
**shed-value-key-list**\
**shed-values**\
**shed-version**\
\ \
**c0**\
**c1**\
**c2**\
**c3**\
**c4**\
**c5**\
**c6**\
**c7**\
**c8**\
**c9**\
**h**  [helm arguments]\
**k**  [kubectl arguments]\
**k-bash** (pod \| type/name) [container]\
**k-logs-f** (pod \| type/name) [container]\
**k-logs-p** (pod \| type/name) [container]\
**k-scale** replicas resourceName\
**k-secret-decode** secretName\
**k-sh** (pod \| type/name) [container]\
**ka** kubectl-delete\
**ka** kubectl-resource\
**sc**\
**shed-kubeconfig-use** kubeconfig-number\
**shed-use** shedCode

# DESCRIPTION
shed programs use environment variable to control which clusters to used. This allow user to connect to different cluster in different shell sessions.

# TERMINOLOGY
**Shed**
: an environment, such as production, test, or development, etc. It can a cluster, a collection of clusters, a namespace or a collection of namespaces.\

**KubeConfig**
: a combination or a kubectl context and/or namespace.


# FILES AND DIRECTORIES
~/.shed/config.yaml
: shed config file, default value of **SHED_CONFIG_FILE** environment variable.

~/.shed/init.d/shed-init/
: user defined scripts that will be executed when shed is initiated by **shed-init**

~/.shed/init.d/shed-use/
: user defined scripts that will be executed when shed is set by **shed-use**.

~/.shed/init.d/shed-kubeconfig-use/
: user defined scripts that will be executed when KubeConfig is set by **shed-kubeconfig-use**.

~/.shed/kubectl-config
: kube config files that will be added to environment variable $KUBECONFIG on by **shed-init**.

# ENVIRONMENT VARIABLES
SHED_CONFIG_HOME
: Home directory for shed config files, default to $HOME/.shed

SHED_CONFIG_FILE
: shed config file, default to $SHED_CONFIG_HOME/config.yaml

SHED_CODE
: the current Shed.

SHED_KUBECONFIG_NUMBER
: the current KubeConfig Number

EDITOR
: Text editor to edit config file, see **shed-config-edit**, default to **vi**.

PS1
: shed-init will modified this shell prompt.

KUBECONFIG
: shed-init will load all files in ~/.shed/kubectl-config directory into this environment variable.

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-env(1), shed-aliases(1)\
shed-list(1), shed-list-code(1)\
shed-config(1), shed-config-edit(1), shed-config-get(1), shed-config.yaml(5)\, shed-contexts(1)\
shed-value(1), shed-values(1), shed-value-key-list(1), shed-version(1)\
shed-use(1), shed-kubeconfig-use(1), shed-kubectl(1), shed-helm(1)\
shed-kubectl-exec-sh(1),shed-kubectl-exec-bash(1),shed-kubectl-scale(1)\
shed-kubectl-logs-follow(1),shed-kubectl-logs-previous(1)\
shed-kubectl-resources(1),shed-kubectl-apply(1),shed-kubectl-delete(1)\
shed-kubectl-secret-decode(1)