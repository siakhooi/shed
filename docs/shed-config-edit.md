# shed-config-edit

Edit shed config file using text editor defined in environment variable EDITOR, default to _vi_.

## SYNOPSIS

```bash
shed-config-edit
shed config-edit
```

## DESCRIPTION

Modify the environment variable EDITOR to use other text editor, example:

```bash
$ EDITOR=nano shed-config-edit
```

Or, you can put the following line in your `~/.bashrc`

```bash
export EDITOR=nano
```

## SCREENSHOTS

![shed-config-edit](shed-config-edit.gif "shed-config-edit")

## SEE ALSO

- [shed-config](shed-config.md)
- [shed-config-get](shed-config-get.md)
- [~/.shed/config.yaml](file-shed-config.yaml.md)
