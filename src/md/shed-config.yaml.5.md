% SHED-CONFIG.YAML(5) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
~/.shed/config.yaml - shed config file

# DESCRIPTION
~/.shed/config.yaml is config file in yaml format, with following available options:

sheds[]\ \ \ \ \ \ \ \ \ \ \ \ \ \ \  # Array of sheds\
\  + code\ \ \ \ \ \ \ \ \ \ \ \ \ \  # code of a shed\
\  + name\ \ \ \ \ \ \ \ \ \ \ \ \ \  # name of a shed\
\  + kubeconfig[0..4]\ \  # Array of kubeconfigs, support up to 5 configs per shed\
\ \ \  + context\ \ \ \ \ \ \ \ \  # context name of kube config\
\ \ \  + namespace\ \ \ \ \ \ \  # optional, namespace of kube config\
shed-init\
\  + shed\ \ \ \ \ \ \ \ \ \ \ \ \ \  # name of a shed to use on initialization

# EXAMPLES
sheds:\
\ \ \  - code: D\
\ \ \ \ \  name: shed-D-development\
\ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \  - context: kube-dev-1\
\ \ \ \ \ \ \ \ \  namespace: ns-application\
\ \ \ \ \ \ \  - context: kube-dev-1\
\ \ \ \ \ \ \ \ \  namespace: ns-database\
\ \ \  - code: T\
\ \ \ \ \  name: shed-T-testing\
\ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \  - context: kube-test-1\
\ \ \ \ \ \ \  - context: kube-test-2\
\ \ \ \ \ \ \  - context: kube-test-3\
\ \ \  - code: P\
\ \ \ \ \  name: shed-P-production\
\ \ \ \ \ \ kubeconfig:\
\ \ \ \ \ \ \  - context: kube-prod-1\
shed-init:\
\ \ \  shed: P

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
shed-config(1), shed-config-edit(1), shed-config-get(1), shed(1)
