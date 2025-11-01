# AWS風カラーテーマ - 使い方

このプロジェクトには、AWSコンソール風のVSCodeカラーテーマが用意されています。

## オプションでテーマを適用する方法

### 方法1: ワークスペースファイルを使う（推奨）

**AWS風テーマを使いたい場合:**
1. `aws-theme.code-workspace` をダブルクリックして開く
2. VSCodeが自動的にAWS風カラーテーマで起動します

**通常のテーマを使いたい場合:**
- プロジェクトフォルダを直接開く（通常通り）
- または他のワークスペースファイルを使う

**メリット:**
- ✅ テーマの切り替えが簡単（開くファイルを変えるだけ）
- ✅ `.vscode/settings.json` に影響しない
- ✅ チームメンバーが選択できる

---

### 方法2: プロファイルを使う（VSCode 1.75以降）

1. `Ctrl+Shift+P` (Mac: `Cmd+Shift+P`)
2. 「Profiles: Create Profile」を選択
3. プロファイル名を「AWS Theme」にする
4. `.vscode/settings.json` の内容をこのプロファイルの設定にコピー

**テーマ切り替え:**
- 左下のプロファイルアイコンをクリック
- 「AWS Theme」と「Default」を切り替え

---

### 方法3: コマンドで一時的に適用

VSCodeのコマンドパレットから：
1. `Ctrl+Shift+P` (Mac: `Cmd+Shift+P`)
2. 「Preferences: Open Settings (JSON)」を選択
3. 必要な時だけカラー設定をコピー＆ペースト

---

## ファイル構成

```
your-project/
├── aws-theme.code-workspace  ← AWS風テーマ付きワークスペース
├── .vscode/
│   └── settings.json         ← プロジェクト共通設定（テーマ設定は含まない）
└── README-AWS-THEME.md       ← このファイル
```

## 推奨構成

```json
// .vscode/settings.json（通常のプロジェクト設定のみ）
{
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  // カラーテーマ設定は含めない
}
```

これにより：
- プロジェクトを普通に開いた場合 → 各自のテーマが適用される
- `aws-theme.code-workspace` で開いた場合 → AWS風テーマが適用される

## Git管理の推奨

```gitignore
# 個人設定は無視
.vscode/settings.json

# ワークスペースファイルは管理対象に含める（オプション扱い）
!aws-theme.code-workspace
```

これにより、チームメンバーが自由に選択できます。
