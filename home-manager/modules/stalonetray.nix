{ config, pkgs, ... }:

{
  home.file.".stalonetrayrc".text = builtins.readFile ./dotfiles/stalonetrayrc;
}

