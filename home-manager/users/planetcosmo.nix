{ config, pkgs, ... }:

{
  home.username = "bluecosmo";
  home.homeDirectory = "/home/bluecosmo";

  home.stateVersion = "24.05";  # ✅ Fix missing stateVersion

  home.packages = with pkgs; [
    git curl htop neofetch vim
  ];

  programs.home-manager.enable = true;
}

