{ config, pkgs, ... }:

{
  home.file.".config/conky.conf".text = builtins.readFile ./dots/conky;
}

