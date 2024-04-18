% SHED-ALIASES(1) Siak Hooi DevUtils 1.1.0 | Shed Commands
% Siak Hooi
% April 2023

# NAME
shed-aliases - list aliases used by shed programs.

# SYNOPSIS
**shed-aliases**

# DESCRIPTION
List aliases used by shed programs.

# EXAMPLES
**shed-aliases**\
\ \ \ \  alias c0='shed-kubeconfig-use 0'\
\ \ \ \  alias c1='shed-kubeconfig-use 1'\
\ \ \ \  alias c2='shed-kubeconfig-use 2'\
\ \ \ \  alias c3='shed-kubeconfig-use 3'\
\ \ \ \  alias c4='shed-kubeconfig-use 4'\
\ \ \ \  alias h='shed-helm'\
\ \ \ \  alias i='shed-istioctl'\
\ \ \ \  alias k='shed-kubectl'\
\ \ \ \  alias k-bash='shed-kubectl-exec-bash'\
\ \ \ \  alias k-logs-f='shed-kubectl-logs-follow'\
\ \ \ \  alias k-logs-p='shed-kubectl-logs-previous'\
\ \ \ \  alias k-scale='shed-kubectl-scale'\
\ \ \ \  alias k-sh='shed-kubectl-exec-sh'

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-env(1)
