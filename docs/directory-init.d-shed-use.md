# ~/.shed/init.d/shed-use

User defined scripts that will be executed when `shed-use` command switch to new Shed.

## DESCRIPTION

The scripts will be executed in alphabetical order. It is recommended to prepend numeric value to the filename to alter the order.

You can add in scripts to extend the functionally of Shed, for example:

- set Shed level environment variables.
- call external commands for Shed level setup.
- etc

## SEE ALSO

- [~/.shed/config.yaml](file-shed-config.yaml.md)
- [~/.shed/init.d/shed-init](directory-init.d-shed-init.md)
- [~/.shed/init.d/shed-kubeconfig-use](directory-init.d-shed-kubeconfig-use.md)
