# Terraform Devcontainers

Devcontainers to develop with Terraform, Terratest and Go

## Features

- Built in vim, jq, git, github cli and ssh server
- A colorfun `.bashrc` with `vi` 
- An `.inputrc` file for for `vi` state indicator
- A script file for creating `.env.example` files.

## Using env example creator

The file resides in `/scripts`. Run the file in your desired path for it to find and create examples for `.env` and `.env.*` files. You will get the best results with this script if you include it among your on save hooks.
