{ config, pkgs, ... }:

{
  home.file.".xonshrc".text = builtins.readFile ./dotfiles/xonshrc;
}

