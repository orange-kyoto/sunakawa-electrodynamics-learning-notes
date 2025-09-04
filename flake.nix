{
  description = "LaTeX repo with tex-fmt and CI format check";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
  let
    systems = [ "x86_64-linux" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
  in
  {
    # ローカル開発用: nix develop で tex-fmt が使える
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        packages = with pkgs; [ tex-fmt git ];
      };
    });

    # CI/ローカル共通のコマンドを apps 化
    apps = forAllSystems (pkgs: {
      # 自動整形（ローカルで手動実行用）
      format = {
        type = "app";
        program = pkgs.writeShellScript "format" ''
          set -euo pipefail
          shopt -s globstar nullglob
          # 必要に応じて検索対象を絞る
          tex-fmt **/*.tex
        '';
      };

      # 変更検知して失敗（CI 用）
      "format-check" = {
        type = "app";
        program = pkgs.writeShellScript "format-check" ''
          set -euo pipefail
          shopt -s globstar nullglob
          tex-fmt **/*.tex
          if ! git diff --exit-code; then
            echo "::error::Formatting issues found. Run 'nix run .#format' locally and commit the changes."
            exit 1
          fi
        '';
      };
    });
  };
}