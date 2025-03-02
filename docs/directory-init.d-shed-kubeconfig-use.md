# ~/.shed/init.d/shed-kubeconfig-use

User defined scripts that will be executed when user switches to new KubeConfig using `shed-kubeconfig-use` command or the aliases `c0`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`, `c8`, `c9`.

## DESCRIPTION

The scripts will be executed in alphabetical order. It is recommended to prepend numeric value to the filename to alter the order.

You can add in scripts to extend the functionally of Shed, for example:

- set KubeConfig level environment variables.
- call external commands for KubeConfig level setup.
- etc

## SEE ALSO

- [~/.shed/config.yaml](file-shed-config.yaml.md)
- [~/.shed/init.d/shed-init](directory-init.d-shed-init.md)
- [~/.shed/init.d/shed-use](directory-init.d-shed-use.md)
