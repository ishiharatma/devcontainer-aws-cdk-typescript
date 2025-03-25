#!/bin/bash
set -ex

## Optional: Copy and update certificates for corporate proxy environments
## Copy and update certificates
#COPY .devcontainer/your-root-ca.cer /usr/local/share/ca-certificates/your-root-ca.crt
#RUN update-ca-certificates
## Update npm config
#RUN npm config set cafile /usr/local/share/ca-certificates/your-root-ca.crt \
#    && npm config set registry http://registry.npmjs.org/ \
#    && npm config set strict-ssl false
# Set AWS_CA_BUNDLE environment variable to the location of the CA bundle
#ENV AWS_CA_BUNDLE /usr/local/share/ca-certificates/your-root-ca.crt

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3 \
    python3-pip \
    jq \
    git \
    curl \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Optional: 
# Tell Git where to find the certificate
#RUN git config --system http.sslCAInfo /usr/local/share/ca-certificates/your-root-ca.crt

# Grant sudo privileges to the node user
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node

# Set user to node
USER node
WORKDIR /home/node

cd /workspaces/${localWorkspaceFolderBasename}
test -f package.json && npm install || echo 'No package.json found, skipping npm install'

echo "checking versions..."
echo "node version: $(node -v)"
echo "npm version: $(npm -v)"
echo "aws version: $(aws --version)"
echo "cdk version: $(cdk --version)"
echo "git version: $(git --version)"

echo "checking aws configuration..."
aws configure list
aws configure list-profiles

