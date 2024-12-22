{ config, pkgs, ... }:

{
  home.file.".config/i3/i3blocks.conf".text = builtins.readFile ./dotfiles/i3blocks.conf;
}

