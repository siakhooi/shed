% SHED-LIST(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
shed-list - print list of codes and names of sheds, configured in the *~/.shed/config.yaml*.

# SYNOPSIS
**shed-list**\
**shed list**

# DESCRIPTION
Print list of code and name of available sheds.

# EXAMPLES
**shed-list**\
\ \ \ \  Code\ \ \ \ \  Name\
\ \ \ \  D\ \ \ \ \ \ \ \  shed-D-development\
\ \ \ \  P\ \ \ \ \ \ \ \  shed-P-production\
\ \ \ \  T\ \ \ \ \ \ \ \  shed-T-testing

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
shed-config(1), shed-config.yaml(5), shed-list-code(1), shed(1)
