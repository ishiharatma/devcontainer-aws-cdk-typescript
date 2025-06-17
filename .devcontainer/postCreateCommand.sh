#!/bin/bash
#set -ex
set -e

#cd /workspaces/${localWorkspaceFolderBasename}
#test -f package.json && npm install || echo 'No package.json found, skipping npm install'

git config --global core.autocrlf false
git config --global core.filemode false

# AWS SSOログインとget-caller-identityのエイリアス設定
# 基本コマンド（デフォルトプロファイル用）
echo 'alias awslogin="aws sso login && echo \"現在の認証情報:\" && aws sts get-caller-identity"' >> ~/.bashrc
#echo 'alias awslogin="aws sso login && echo \"現在の認証情報:\" && aws sts get-caller-identity"' >> ~/.zshrc
echo 'alias awsid="aws sts get-caller-identity"' >> ~/.bashrc
#echo 'alias awsid="aws sts get-caller-identity"' >> ~/.zshrc

# NPM関連のエイリアス
echo 'alias npmfl="npm run format && npm run lint:fix"' >> ~/.bashrc

# CDK関連のエイリアス
echo 'alias cdksynth="npm run cdk synth \"Dev/*\""' >> ~/.bashrc

# その他のエイリアス
echo '
# プロファイル指定可能なAWS SSOログイン関数
awsloginp() {
  if [ -z "$1" ]; then
    echo "使用法: awsloginp <プロファイル名>"
    return 1
  fi
  aws sso login --profile "$1" && echo "現在の認証情報 ($1):" && aws sts get-caller-identity --profile "$1"
}

# プロファイル指定可能なAWS認証情報確認関数
awsidp() {
  if [ -z "$1" ]; then
    echo "使用法: awsidp <プロファイル名>"
    return 1
  fi
  aws sts get-caller-identity --profile "$1"
}

# プロファイル指定可能なAWS SSOログイン関数
awsloginp() {
  if [ -z "$1" ]; then
    echo "使用法: awsloginp <プロファイル名>"
    return 1
  fi
  aws sso login --profile "$1" && echo "現在の認証情報 ($1):" && aws sts get-caller-identity --profile "$1"
}

# プロファイル指定可能なAWS認証情報確認関数
awsidp() {
  if [ -z "$1" ]; then
    echo "使用法: awsidp <プロファイル名>"
    return 1
  fi
  aws sts get-caller-identity --profile "$1"
}

# エイリアスのTipsを表示する関数
tips() {
  echo "-----------------------------------"
  echo "便利なコマンドTips"
  echo "-----------------------------------"
  echo "AWS関連："
  echo "  「awslogin」: AWS SSOログイン + 現在の認証情報確認（デフォルトプロファイル）"
  echo "  「awsid」: 認証情報確認のみ（デフォルトプロファイル）"
  echo "  「awsloginp <プロファイル名>」: 指定プロファイルでAWS SSOログイン + 認証情報確認"
  echo "  「awsidp <プロファイル名>」: 指定プロファイルで認証情報確認のみ"
  echo ""
  echo "NPM関連："
  echo "  「npmfl」: linter および formatter の実行（npm run format && npm run lint:fix）"
  echo "CDK関連："
  echo "  「cdksynth」: CloudFormation テンプレートの生成（npm run cdk synth \"Dev/*\"）"
  echo ""
  echo "その他："
  echo "  「tips」: このヘルプメッセージを表示"
  echo "-----------------------------------"
  echo "例:"
  echo "  awslogin             ： デフォルトプロファイルでログイン"
  echo "  awsloginp dev-admin  ： devプロファイルでログイン"
  echo "  npmfl                ： linter および formatter の実行"
  echo "-----------------------------------"
}
' >> ~/.bashrc

# 変更を現在のシェルに反映させる
#source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null
source ~/.bashrc 2>/dev/null


echo "-----------------------------------"
echo "checking versions..."
echo "-----------------------------------"

echo "node version: $(node -v)"
echo "npm version: $(npm -v)"
echo "aws version: $(aws --version)"
echo "cdk version: $(cdk --version)"
echo "git version: $(git --version)"

echo "uv version: $(uv --version)"
echo "uvx version: $(uvx --version)"

echo "-----------------------------------"
echo "checking aws configuration..."
echo "-----------------------------------"

# "Error when retrieving token from sso: Token has expired and refresh failed" というエラーが出る場合に
# 戻り値が正常でなくなるため、echo ""をつけておく
# 本来は、aws sso login <profile>を実行してトークンを更新する必要がある
echo "## aws configure list"
aws configure list || echo ""
echo "## aws configure list-profiles"
aws configure list-profiles || echo ""

# 初回のtips表示
echo "登録済みの便利なコマンドエイリアスは、tipsコマンドを実行して確認してください"
