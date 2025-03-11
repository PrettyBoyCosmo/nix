{ config, pkgs, ... }:

{
  users.users.bluecosmo = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

