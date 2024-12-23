{ config, pkgs, ... }:

{
  xdg.configFile.".dmrc".text = ''
    [Desktop]
    Session=i3
  '';
}


