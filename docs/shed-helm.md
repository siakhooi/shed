# shed-helm

Run helm command with context and/or namespace from current KubeConfig.

## SYNOPSIS

```bash
shed-helm [helm arguments]
shed helm [helm arguments]
h [helm arguments]
```

## DESCRIPTION

shed-helm - run helm with context and/or namespace from current KubeConfig.\
h - alias to shed-helm

## SCREENSHOTS

![shed-helm](shed-helm.gif "shed-helm")

## ENVIRONMENT VARIABLES

- `SHED_BASH_DEBUG_MODE_OFF` - when set to 'Y', turn off `set -x`

## SEE ALSO

- [shed-config](shed-config.md)
- [shed-kubeconfig-use](shed-kubeconfig-use.md)
- [shed-kubectl](shed-kubectl.md)
- [shed-use](shed-use.md)
