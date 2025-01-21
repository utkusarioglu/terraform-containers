#!/bin/bash

set -eux
bash --version

ARGS=(
  go_version
)
. ${0%/*}/../linux/parse-args.sh

# Install go
go_url=https://go.dev/dl/go${go_version}.linux-amd64.tar.gz
wget -O go.tar.gz ${go_url}
rm -rf /usr/local/go
tar -C /usr/local -xzf go.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

# Install hclq
wget -O install-hclq.sh https://install.hclq.sh
sh install-hclq.sh
rm install-hclq.sh
hclq --version

# Install infracost
wget -O install-infracost.sh https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
chmod +x install-infracost.sh
./install-infracost.sh
rm install-infracost.sh
mkdir -p $HOME/.config/infracost
# RUN chown -R $USERNAME:$GROUP $HOME/.config
infracost --version

# Install k3d
wget -O install-k3d.sh https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh
chmod +x install-k3d.sh
./install-k3d.sh
rm install-k3d.sh
k3d --version
