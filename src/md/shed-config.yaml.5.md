% SHED-CONFIG.YAML(5) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% March 2023

# NAME
~/.shed/config.yaml - shed config file

# DESCRIPTION
~/.shed/config.yaml is config file in yaml format, with following available options:

sheds[]\ \ \ \ \  # Array of sheds\
\  + code\ \ \ \  # code of a shed\
\  + name\ \ \ \  # name of a shed

# EXAMPLES
sheds:\
\ \ \  - code: D\
\ \ \ \ \  name: shed-D-development\
\ \ \  - code: T\
\ \ \ \ \  name: shed-T-testing\
\ \ \  - code: C\
\ \ \ \ \  name: shed-P-production

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
