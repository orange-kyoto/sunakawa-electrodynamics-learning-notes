# 砂川理論電磁気学の学習ノート

行間の補足やメモなど、読み進めている中で記録しておきたいことを残していく個人の学習プロジェクトです。

## TeX フォーマッタ（tex-fmt）

このリポジトリでは、TeX ソースの自動整形に [tex-fmt](https://github.com/WGUNDERWOOD/tex-fmt) を利用します。

### セットアップ手順（ローカル）

1) Rust の導入（rustup）
- macOS (Homebrew): `brew install rustup-init` → `rustup-init` を実行
- 公式インストーラ: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- 環境反映: `source "$HOME/.cargo/env"`

2) tex-fmt のインストール（Cargo）
- インストール: `cargo install tex-fmt`
- 確認: `tex-fmt --version`

### 使い方（Make 経由）

```
$ make fmt
```

補足:
- 上記ターゲットはリポジトリ内の `*.tex` を対象に実行します。
