{ lib, config, ... }: {
  imports = [
    ./conform.nix
    ./fidget.nix
    ./lsp-nvim.nix
    ./lspsaga.nix
    ./trouble.nix
    ./lazy-lsp.nix
  ];

  options = { lsp.enable = lib.mkEnableOption "Enable lsp module"; };
  config = lib.mkIf config.dap.enable {
    conform.enable = lib.mkDefault true;
    fidget.enable = lib.mkDefault true;
    lsp-nvim.enable = lib.mkDefault true;
    lspsaga.enable = lib.mkDefault false;
    trouble.enable = lib.mkDefault true;
    lazy-lsp.enable = lib.mkDefault true;
  };
}
