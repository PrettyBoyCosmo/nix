{ config, pkgs, ... }:

{
  home.file.".config/picom/picom.conf".text = builtins.readFile ./dotfiles/picom.conf;
}

