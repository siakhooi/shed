% SHED-KUBECTL-SECRET-DECODE(1) Siak Hooi DevUtils 1.1.0|Shed Commands
% Siak Hooi
% April 2023

# NAME
shed-kubectl-secret-decode - read secret, decode all data with base64 and print onto screen.\
k-secret-decode - alias to shed-kubectl-secret-decode

# SYNOPSIS
**shed-kubectl-secret-decode** secretName\
**shed kubectl-secret-decode** secretName\
**k-secret-decode** secretName

# DESCRIPTION
Read secret, decode all data with base64 and print onto screen.

# EXAMPLES
**shed-kubectl-secret-decode** mySecret\
 \ \ \ \ \ + kubectl --context kube-dev-1 get secrets/mySecret -o yaml\
 \ \ \ \ \ [key1]\
 \ \ \ \ \ value 1\
 \ \
 \ \ \ \ \ [key2]\
 \ \ \ \ \ value 2

# LICENSE
MIT

# BUGS
Report bugs at https://github.com/siakhooi/shed/issues.

# SEE ALSO
shed-kubectl(1)
