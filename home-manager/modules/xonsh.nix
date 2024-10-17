{ config, pkgs, ... }:

{
  home.file.".xonshrc".text = builtins.readFile ./dots/xonshrc;
}

