{ pkgs, ... }:

{
  home.file.".config/nvim/init.lua".text = builtins.readFile ./dotfiles/init.lua;

  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
  };
}
