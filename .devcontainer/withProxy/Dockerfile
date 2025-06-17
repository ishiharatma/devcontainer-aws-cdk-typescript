FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bullseye

# 証明書をコピーして更新
COPY .devcontainer/withProxy/YourRootCA.cer /usr/local/share/ca-certificates/YourRootCA.crt
RUN update-ca-certificates
# npm に証明書の場所を指定し、SSL 設定を調整
RUN npm config --global set cafile /etc/ssl/certs/ca-certificates.crt \
    && npm config --global set registry http://registry.npmjs.org/ \
    && npm config --global set strict-ssl false \
    && git config --system http.sslCAInfo /usr/local/share/ca-certificates/YourRootCA.crt

ENV AWS_CA_BUNDLE=/usr/local/share/ca-certificates/YourRootCA.crt

# 追加パッケージをインストール
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

# Install AWS Session Manager Plugin
RUN export CPU="" && \
    if [ $(uname -m) = "x86_64" ]; then \
    export CPU="ubuntu_64bit"; \
    elif [ $(uname -m) = "aarch64" ]; then \
    export CPU="ubuntu_arm64"; \
    fi && \
    if [ -n "$CPU" ]; then \
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/${CPU}/session-manager-plugin.deb" \
    -o session-manager-plugin.deb && \
    apt-get update && \
    apt-get install -y ./session-manager-plugin.deb && \
    rm -rf ./session-manager-plugin.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*; \
    else \
    echo "Unknown architecture for AWS Session Manager Plugin installation"; \
    fi

# nodeユーザーにsudo権限を付与
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node

# ユーザーをnodeに設定
USER node
WORKDIR /home/node

# Git に証明書の場所を指定
# npm 設定を node ユーザーにも再設定（念のため）
RUN npm config set cafile /etc/ssl/certs/ca-certificates.crt \
    && npm config set registry https://registry.npmjs.org/ \
    && npm config set strict-ssl true \
    && git config --global http.sslCAInfo /usr/local/share/ca-certificates/YourRootCA.crt

# uvのインストール
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
# PATHに.local/binを追加
ENV PATH="/home/node/.local/bin:${PATH}"