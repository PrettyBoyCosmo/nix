{ config, ... }:
let
  inherit (config.flake) userModules;
in
{
  machines.ccs = {
    hardware = ./hardware.nix;
    host = ./host;
    users.bluecosmo = userModules.bluecosmo;
    stateVersion = "24.11";
  };
}
