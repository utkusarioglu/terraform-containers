#!/bin/bash

set -eux
bash --version

ARGS=(
  go_version
  helm_version
)
. ${0%/*}/../linux/parse-args.sh

# Install go
go_url=https://go.dev/dl/go${go_version}.linux-amd64.tar.gz
wget -O go.tar.gz ${go_url}
rm -rf /usr/local/go
tar -C /usr/local -xzf go.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

# Install terraform
wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  | tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt install terraform
terraform -help

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

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client --output=yaml

# Install helm
wget -O helm.tar.gz https://github.com/helm/helm/releases/download/${helm_version}/helm-v3.17.0-linux-amd64.tar.gz.asc
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm helm.tar.gz
helm --version

# Install aws cli
wget -O "awscliv2.zip" "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" 
unzip awscliv2.zip
./aws/install
aws --version
