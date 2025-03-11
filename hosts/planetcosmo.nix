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
    ../modules/packages/server.nix
    ../modules/packages/development.nix
    ../modules/packages/cybersecurity.nix
  ];

  networking.hostName = "planetcosmo";

  # ✅ Enable SSH for remote access
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes"; # Optional, allows root login
      PasswordAuthentication = true; # Allows password login
    };
  };

  # ✅ System Packages
  environment.systemPackages = with pkgs; [
    vim htop neofetch curl git
  ];

  # ✅ User Configuration
  users.users.planetcosmo = {
    isNormalUser = true;
    home = "/home/planetcosmo";
    description = "Planet Cosmo User";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };

  # ✅ Ensure Home Manager is enabled
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
}

