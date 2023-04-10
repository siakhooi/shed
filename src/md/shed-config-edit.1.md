% SHED-CONFIG-EDIT(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-config-edit - edit shed config file with text editor

# SYNOPSIS
**shed-config-edit**\
**shed config-edit**

# DESCRIPTION
Edit shed config file using text editor defined in variable EDITOR, default to *vi*.

If shed config file has not yet been created, a sample will be created, with example of sheds for reference.

# EXIT CODE
**1**
: Environment variable SHED_CONFIG_FILE is not set.

# FILES
~/.shed/config.yaml
: shed config file

# ENVIRONMENT VARIABLES
SHED_CONFIG_FILE
: shed config file, default to $SHED_CONFIG_HOME/config.yaml

EDITOR
: text editor to use to edit shed config file, default to *vi*.

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-config(1), shed-config-get(1), shed-config.yaml(5), shed(1)
