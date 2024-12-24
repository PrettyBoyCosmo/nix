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

  # NixVim Configuration
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    editor = {
      colorscheme = "nightfox"; # Replace with your preferred colorscheme
      opts = {
        swapfile = true;
        directory = "/home/bluecosmo/.local/state/nvim/swap//"; # Ensure this path exists
      };
    };

    plugins = [
      nixvim.plugins.airline
      nixvim.plugins.treesitter
      nixvim.plugins.telescope
      nixvim.plugins.lsp
      nixvim.plugins.notify
    ];
  };
}

# { config, pkgs, ... }:
#
# {
#   imports = [
#     ./modules/all.nix
#   ];
#
#   home.username = "bluecosmo";
#   home.homeDirectory = "/home/bluecosmo";
#   home.stateVersion = "24.05"; # Update as needed
#
#   programs.man.generateCaches = true;
#
#   programs.obs-studio = {
#     enable = true;
#     plugins = with pkgs.obs-studio-plugins; [
#       waveform
#     ];
#   };
# }
