# AWS CDK TypeScript 開発コンテナテンプレート

[![🇯🇵 日本語](https://img.shields.io/badge/%F0%9F%87%AF%F0%9F%87%B5-日本語-white)](./README.ja.md) [![🇺🇸 English](https://img.shields.io/badge/%F0%9F%87%BA%F0%9F%87%B8-English-white)](./README.md)

AWS CDK TypeScript開発用のdevcontainer設定を含むテンプレートリポジトリ。AWS CDKとTypeScriptを使用したクラウドインフラストラクチャのコード開発のために、事前に設定されたツールと依存関係を備えた、すぐに使える開発環境です。

## 概要

このテンプレートは、TypeScriptを使用したAWS CDKプロジェクト用の完全な開発環境を提供します。開発コンテナには以下のものが事前設定されています：

- Debian Bullseye上のNode.js 22
- AWS CLI
- AWS CDK CLI
- Gitおよびその他の基本的な開発ツール
- TypeScript、AWS、その他のためのVS Code拡張機能
- 事前設定されたリンティングとフォーマット設定

開発コンテナを使用することで、チームメンバー間で一貫した開発環境を確保し、「自分のマシンでは動作する」問題を軽減します。

## 始め方

### 1. テンプレートを入手する

テンプレートを使用するには2つの方法があります：

**オプションA: GitHubの「Use this template」機能を使用する**
1. このリポジトリの上部にある「Use this template」ボタンをクリックします
2. 新しいリポジトリに名前を付けます
3. パブリックまたはプライベートにするかを選択します
4. 「Create repository from template」をクリックします

**オプションB: クローンして再初期化する**
```bash
# テンプレートリポジトリをクローン
git clone https://github.com/yourusername/aws-cdk-typescript-devcontainer.git my-new-project
cd my-new-project
# 既存のgit履歴を削除して新たに開始
rm -rf .git
git init
git add .
git commit -m "テンプレートからの初期コミット"
```

### 2. 新しいプロジェクトをクローンする

上記のオプションAを使用した場合：
```bash
git clone https://github.com/yourusername/your-new-repo-name.git
cd your-new-repo-name
```

### 3. VS Codeで開く

```bash
code .
```

### 4. Dev Containers拡張機能を使用する

1. まだインストールしていない場合は、VS Codeに[Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)拡張機能をインストールします
2. VS Codeの左下隅にある緑色のボタンをクリックします
3. メニューから「Reopen in Container」を選択します

VS Codeは開発コンテナをビルドし、その中でプロジェクトを開きます。初回は数分かかることがあります。

### 5. 環境をカスタマイズする（オプション）

1. `.devcontainer/devcontainer.json`を編集して：
   - コンテナ名をプロジェクトに合わせて変更する
   - 必要な追加ツールや拡張機能のコメントを解除するか追加する
   - 環境固有の設定を構成する

2. このREADME.mdをプロジェクト固有のドキュメントに置き換える

## 次のステップ

開発コンテナが実行されたら：

1. CDKプロジェクトを初期化します：
   ```bash
   cdk init app --language typescript
   ```

2. インフラストラクチャの構築を開始しましょう！

## トラブルシューティング

- **コンテナのビルドに失敗する**：Dockerが実行されていることと、十分なディスク容量があることを確認してください
- **AWS認証情報が機能しない**：AWS認証情報が正しく設定されていることを確認してください
- **VS Code拡張機能が読み込まれない**：「Rebuild Container」コマンドでコンテナを再ビルドしてみてください

## Contributing

このテンプレートを改善するためのContributingは歓迎します！プルリクエストを送るか、Issueを開いてください。

## ライセンス

このテンプレートは[MITライセンス](LICENSE)の下で利用可能です。
