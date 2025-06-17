FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bullseye

## optional, uncomment if neede: Place your certificate under the .devcontainer folder and rename it to your-root-ca.crt
## Copy and update certificates for corporate proxy environments
#COPY .devcontainer/your-root-ca.crt /usr/local/share/ca-certificates/your-root-ca.crt
#RUN update-ca-certificates
## Update npm config
#RUN npm config set cafile /etc/ssl/certs/ca-certificates.crt \
#    && npm config set registry http://registry.npmjs.org/ \
#    && npm config set strict-ssl false
## Set AWS_CA_BUNDLE environment variable to the location of the CA bundle
#ENV AWS_CA_BUNDLE=/usr/local/share/ca-certificates/your-root-ca.crt

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

# Grant sudo privileges to the node user
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node

## optional, uncomment if neede:
# Tell Git where to find the certificate
#RUN git config --global http.sslCAInfo /usr/local/share/ca-certificates/your-root-ca.crt

# Set user to node
USER node
WORKDIR /home/node