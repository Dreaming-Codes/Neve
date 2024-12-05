{ lib, config, pkgs, ... }: {
  options = { flutter.enable = lib.mkEnableOption "Enable flutter module"; };
  config = lib.mkIf config.flutter.enable {
    extraPlugins = with pkgs.vimPlugins; [ flutter-tools-nvim dart-vim-plugin ];
    extraConfigLua = ''
      require("flutter-tools").setup {
        lsp = {
          capabilities = require("cmp_nvim_lsp").default_capabilities()
        }
      }
    '';
  };
}
