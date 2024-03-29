% SHED-VALUE(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-value - get the config value of current shed.

# SYNOPSIS
**shed-value** yamlPath\
**shed value** yamlPath

# DESCRIPTION
Get the config value at path **yamlPath** of current shed.

# EXAMPLES
**shed-value** .name
: shed-D-development

**shed-value** .code
: D

# FILES
~/.shed/config.yaml
: shed config file

# ENVIRONMENT VARIABLES
SHED_CONFIG_FILE
: shed config file, default to $SHED_CONFIG_HOME/config.yaml

SHED_CODE
: the current Shed.

# EXIT CODE
**1**
: Environment variable SHED_CONFIG_FILE is not set.

**2**
: File stated in SHED_CONFIG_FILE does not exist.

**3**
: Environment variable SHED_CODE is not set, use **shed-use** to set a shedCode.


# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-use(1), shed-values(1), shed-config(1), shed-config.yaml(5), shed-value-key-list(1)
