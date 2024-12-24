{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins/all.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.nightfox.enable = true;
    colorschemes.nightfox.flavor = "nordfox";
    # colorschemes.catppuccin.enable = true;
    # colorschemes.dracula-nvim.enable = true;
    # colorschemes.nightfox.flavor = "duskfox";
    # colorschemes.poimandres.enable = true;
  };
}

