# 砂川理論電磁気学の学習ノート

行間の補足やメモなど、読み進めている中で記録しておきたいことを残していく個人の学習プロジェクトです。

## TeX フォーマッタ

このリポジトリでは [tex-fmt](https://github.com/WGUNDERWOOD/tex-fmt) を使って TeX ソースを整形します。

### セットアップ

```bash
# Rust (rustup) を入れていない場合
brew install rustup-init && rustup-init   # macOS
# または公式インストーラ: https://rustup.rs

# tex-fmt の導入
cargo install tex-fmt
```

### 使い方

```
make fmt       # .tex ファイルを整形
make fmt-check # CI と同じ整形チェック
```