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

cd /workspaces/${localWorkspaceFolderBasename}
test -f package.json && npm install || echo 'No package.json found, skipping npm install'

echo "checking versions..."
echo "node version: $(node -v)"
echo "npm version: $(npm -v)"
echo "aws version: $(aws --version)"
echo "cdk version: $(cdk --version)"

echo "checking aws configuration..."
aws configure list
aws configure list-profiles

