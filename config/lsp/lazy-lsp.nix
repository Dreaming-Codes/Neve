{ lib, config, pkgs, ... }: {
  options = { lazy-lsp.enable = lib.mkEnableOption "Enable lazy-lsp module"; };
  config = lib.mkIf config.lazy-lsp.enable {
    extraPlugins = with pkgs.vimPlugins; [ lazy-lsp-nvim ];
    extraConfigLua = ''
      require('lazy-lsp').setup {
        excluded_servers = {
          "dartls", -- already configured by flutter-tools
          "vuels", -- seems to be broken
        },
        prefer_local = true
      }
    '';
  };
}
