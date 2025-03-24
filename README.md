# AWS CDK TypeScript Dev Container Template

[![🇯🇵 日本語](https://img.shields.io/badge/%F0%9F%87%AF%F0%9F%87%B5-日本語-white)](./README.ja.md) [![🇺🇸 English](https://img.shields.io/badge/%F0%9F%87%BA%F0%9F%87%B8-English-white)](./README.md)

A template repository for AWS CDK TypeScript development with devcontainer configuration. Ready-to-use development environment with pre-configured tools and dependencies for cloud infrastructure as code development using AWS CDK and TypeScript.

## Overview

This template provides a complete development environment for AWS CDK projects using TypeScript. The dev container comes pre-configured with:

- Node.js 22 on Debian Bullseye
- AWS CLI
- AWS CDK CLI
- Git and other essential development tools
- VS Code extensions for TypeScript, AWS, and more
- Preconfigured linting and formatting settings

Using dev containers ensures consistent development environments across team members and reduces the "it works on my machine" problem.

## Getting Started

### 1. Obtain the Template

There are two ways to use this template:

**Option A: Use GitHub's "Use this template" feature**
1. Click the "Use this template" button at the top of this repository
2. Give your new repository a name
3. Choose to make it public or private
4. Click "Create repository from template"

**Option B: Clone and reinitialize**
```bash
# Clone the template repository
git clone https://github.com/yourusername/aws-cdk-typescript-devcontainer.git my-new-project
cd my-new-project
# Remove existing git history and start fresh
rm -rf .git
git init
git add .
git commit -m "Initial commit from template"
```

### 2. Clone Your New Project

If you used Option A above:
```bash
git clone https://github.com/yourusername/your-new-repo-name.git
cd your-new-repo-name
```

### 3. Open in VS Code

```bash
code .
```

### 4. Use Dev Containers Extension

1. Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code if you haven't already
2. Click on the green button in the lower-left corner of VS Code
3. Select "Reopen in Container" from the menu

VS Code will build the dev container and open your project inside it. This may take a few minutes the first time.

### 5. Customize the Environment (Optional)

1. Edit `.devcontainer/devcontainer.json` to:
   - Change the container name to match your project
   - Uncomment or add any additional tools or extensions you need
   - Configure environment-specific settings

2. Replace this README.md with your project-specific documentation

## Next Steps

Once your dev container is running:

1. Initialize your CDK project:
   ```bash
   cdk init app --language typescript
   ```

2. Start building your infrastructure!

## Troubleshooting

- **Container fails to build**: Check Docker is running and you have sufficient disk space
- **AWS credentials not working**: Ensure you've configured your AWS credentials correctly
- **VS Code extensions not loading**: Try rebuilding the container with the "Rebuild Container" command

## Contributing

Contributions to improve this template are welcome! Please submit a pull request or open an issue.

## License

This template is available under the [MIT License](LICENSE).
