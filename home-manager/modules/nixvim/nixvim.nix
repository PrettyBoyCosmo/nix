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
    # colorschemes.catppuccin.enable = true;
    # colorschemes.dracula-nvim.enable = true;
    colorschemes.nightfox.enable = true;
    # colorschemes.nightfox.flavor = "duskfox";
    # colorschemes.poimandres.enable = true;

    highlight = {
      Normal = {
        bg = "#0f1c21";
      };
      TelescopeNormal = {
        bg = "#0f1c21";
      };
      TelescopeBorder = {
        bg = "#0f1c21";
        fg = "#0f1c21"; # Optional: Makes the border seamless
      };
      TelescopePromptNormal = {
        bg = "#0f1c21";
      };
      TelescopePromptBorder = {
        bg = "#0f1c21";
        fg = "#0f1c21";
      };
      TelescopePreviewNormal = {
        bg = "#0f1c21";
      };
      TelescopePreviewBorder = {
        bg = "#0f1c21";
        fg = "#0f1c21";
      };
      TelescopeResultsNormal = {
        bg = "#0f1c21";
      };
      TelescopeResultsBorder = {
        bg = "#0f1c21";
        fg = "#0f1c21";
      };
      HarpoonNormal = {
        fg = "#0f1c21";
        bg = "#0f1c21";
      };
      HarpoonBorder = {
        bg = "#0f1c21";
        fg = "#0f1c21";
      };
    };

  };
}
