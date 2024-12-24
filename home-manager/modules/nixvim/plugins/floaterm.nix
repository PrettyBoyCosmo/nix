{
  programs.nixvim.plugins.floaterm = {
    enable = true;

    width = 0.8;
    height = 0.8;
    shell = "/home/bluecosmo/.nix-profile/bin/bash";

    title = "";

    keymaps.toggle = "<C-b>";
  };
}
