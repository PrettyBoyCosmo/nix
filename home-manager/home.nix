{ config, pkgs, ... }:

{
  imports = [
    ./modules/all.nix  # Shared Home Manager configurations
  ];

  home.stateVersion = "24.05"; # Update as needed

  programs.man.generateCaches = true;
}

