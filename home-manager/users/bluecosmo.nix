{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
    ../modules/i3.nix
    ../modules/waybar.nix
    ../modules/hyprland.nix
    ../modules/kitty.nix
    ../modules/tmux.nix
    ../modules/wofi.nix
    ../modules/nixvim/nixvim.nix
  ];

  home.username = "bluecosmo";
  home.homeDirectory = "/home/bluecosmo";

  home.packages = with pkgs; [
    firefox
    discord
    libreoffice
    vlc
    obs-studio
    gimp
    spotify
  ];
}

