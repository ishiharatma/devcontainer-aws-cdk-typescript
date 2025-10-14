ARG VARIANT="1-22-bookworm"
FROM mcr.microsoft.com/devcontainers/typescript-node:${VARIANT}

# 追加パッケージをインストール
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    graphviz \
    jq \
    git \
    curl \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# nodeユーザーにsudo権限を付与
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node

# install AWS CDK and TypeScript
RUN npm install -g aws-cdk aws-cdk-local typescript

# AWS CLI v2のインストール（アーキテクチャ判定）
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    fi && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

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

# ユーザーをnodeに設定
USER node
WORKDIR /home/node

# uvのインストール
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
# PATHに.local/binを追加
ENV PATH="/home/node/.local/bin:${PATH}"

# LocalStack CLI
RUN pip3 install --user awscli-local --break-system-packages

ARG LOCALSTACK_VERSION="4.9.1"
RUN export FILE="" && \
    if [ $(uname -m) = "x86_64" ]; then \
        export FILE="localstack-cli-${LOCALSTACK_VERSION}-linux-amd64-onefile.tar.gz"; \
    elif [ $(uname -m) = "aarch64" ]; then \
        export FILE="localstack-cli-${LOCALSTACK_VERSION}-linux-arm64-onefile.tar.gz"; \
    fi && \
    if [ -n "$FILE" ]; then \
        echo "v${LOCALSTACK_VERSION}/Downloading ${FILE}" && \
        curl --output "${FILE}" --location "https://github.com/localstack/localstack-cli/releases/download/v${LOCALSTACK_VERSION}/${FILE}" && \
        sudo tar xvzf "${FILE}" -C /usr/local/bin && \
        rm "${FILE}"; \
    fi

# PATHの設定（コンテナ起動時用）
ENV PATH="/home/node/.local/bin:${PATH}"