{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/common.nix
    ../modules/networking.nix
    ../modules/bootloader.nix
    ../modules/users.nix
    ../modules/services.nix
    ../modules/packages/common.nix
    ../modules/packages/desktop.nix
    ../modules/packages/development.nix
  ];

  # Hostname
  networking.hostName = "bluecosmo";

  # ✅ User Configuration (bluecosmo only)
  users.users.bluecosmo = {
    isNormalUser = true;
    home = "/home/bluecosmo";
    description = "Blue Cosmo User";
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.bash;
  };

  # ✅ Home Manager Integration (only for bluecosmo)
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
}

