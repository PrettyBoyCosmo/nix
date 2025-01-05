{ config, lib, ... }:
let
  inherit (lib)
    mkEnableOption
    mkIf
    ;

  cfg = config.custom.nixvim;
in
{
  options.custom.nixvim = {
    enable = mkEnableOption "nixvim";
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      colorschemes.nightfox.enable = true;
      colorschemes.nightfox.flavor = "nordfox";
      # colorschemes.catppuccin.enable = true;
      # colorschemes.dracula-nvim.enable = true;
      # colorschemes.nightfox.flavor = "duskfox";
      # colorschemes.poimandres.enable = true;
    };
  };
}

