{ config, pkgs, ... }:

{
  home.file.".config/rofi/config.rasi".text = builtins.readFile ./dotfiles/config.rasi;
}

