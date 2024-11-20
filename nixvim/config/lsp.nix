{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    # https://nix-community.github.io/nixvim/plugins/lsp/index.html
    servers = {
      nixd.enable = true;
      html.enable = true;
      clojure_lsp.enable = true;
      csharp_ls.enable = true;
      eslint.enable = true;
      marksman.enable = true;
      pyright.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      sqls.enable = true;
      svelte.enable = true;
      zls.enable = true;
      jsonls.enable = true;

    };

  };
}
