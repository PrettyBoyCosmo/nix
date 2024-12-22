{ config, pkgs, ... }:

{
  home.file.".config/i3/config".text = builtins.readFile ./dots/xonshrc;
}

