{ config, pkgs, lib, ... }:

{
  networking.hostName = "ccs";
  nixpkgs.config.allowBroken = true;

  # Users
  users.users.bluecosmo = {
    isNormalUser = true;
    home = "/home/bluecosmo";
    description = "Blue Cosmo User";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };
}

