{ flakeRoot, pkgs, ... }:

{
  imports = [
    (flakeRoot + "/home-manager/modules/all.nix")
  ];

  programs.man.generateCaches = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      waveform
    ];
  };
}
