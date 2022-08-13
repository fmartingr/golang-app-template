# Helm chart

## Install the chart

```
helm install --namespace golang-app-template --atomic  golang-app-template .
```

## Upgrading the chart

```
helm upgrade --namespace golang-app-template --atomic golang-app-template .
```

## Using locally with latest dev image

A `values.local.yml` file is provided which will point the installation to the latest `dev` image.
