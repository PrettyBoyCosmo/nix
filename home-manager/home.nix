{ config, pkgs, ... }:

{
  imports = [
    ./modules/all.nix
  ];

  home.username = "bluecosmo";
  home.homeDirectory = "/home/bluecosmo";
  home.stateVersion = "24.05"; # Update as needed

  programs.man.generateCaches = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      waveform
    ];
  };
}
