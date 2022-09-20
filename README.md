# Terraform Containers

Produces Terraform containers for development

## Why?

You could ask, why would this repo exist while Terraform itself publishes
perfectly fine containers. There are mainly two reasons for this repo's 
existence:

1. The images created by this repo are devcontainers, compliant with the devcontainer spec. They contain devcontainer features such as github cli, and helm.
2. The images contain Terratest, a testing tool for Terraform built infrastructures (and a bit more).

Basically, this repo's images offer convenience and better DX.

## Acknowledgements

The base image used for these images comes from [austincloud/terratest](https://hub.docker.com/r/austincloud/terratest). This repo adds a few
gists and devcontainer features on top of it (for now at least).
