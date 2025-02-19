{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vim-table-mode
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>tm";
        action = ":TableModeToggle<CR>";
        options.silent = true;
      }
    ];
  };
}
