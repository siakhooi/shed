% SHED(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed is a collection of several bash scripts to manage Kubernetes clusters.

# SYNOPSIS
**shed list**\
**shed list-code**\
**shed env**\
**shed config**\
**shed config-edit**\
**shed config-get** yamlPath\
**shed help**\
**shed value** yamlPath\
**shed values**\
\ \
**shed-list**\
**shed-list-code**\
**shed-env**\
**shed-config**\
**shed-config-edit**\
**shed-config-get** yamlPath\
**shed-use** shedCode\
**shed-value** yamlPath\
**shed-values**

# DESCRIPTION
shed programs use environment variable to control which clusters to used. This allow user to connect to different cluster in different shell sessions.

# FILES
~/.shed/config.yaml
: shed config file, default value of **SHED_CONFIG_FILE** environment variable.

~/.shed/init.d/shed-init/
: user defined scripts that will be executed when shed is initiated by **/usr/lib/shed/shed-init**

~/.shed/init.d/shed-use/
: user defined scripts that will be executed when shed is set by **shed-use**.

# ENVIRONMENT VARIABLES
SHED_CONFIG_HOME
: Home directory for **shed** config files, default to $HOME/.shed

SHED_CONFIG_FILE
: **shed** config file, default to $SHED_CONFIG_HOME/config.yaml

EDITOR
: Text editor to edit config file, see **shed-config-edit**, default to **vi**.

SHED_CODE
: the current Shed.

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-env(1)\
shed-list(1), shed-list-code(1)\
shed-config(1), shed-config-edit(1), shed-config-get(1), shed-config.yaml(5)\
shed-value(1), shed-values(1)\
shed-use(1)
