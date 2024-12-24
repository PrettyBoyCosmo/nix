{ config, lib, ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<leader>s" = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
          "<leader>x" = "<cmd>!chmod +x %<CR>";
          "n" = "nzzzv";
          "N" = "Nzzzv";
          "<C-d>" = "<C-d>zz";
          "<C-u>" = "<C-u>zz";
          "<CR>" = ":normal! zz<CR>";
          "gg" = "ggzz";
          "GG" = "GGzz";
          "<Leader>q" = ":Alpha<CR>";
          "<Leader>l" = ":Mason<CR>";
          "<Leader>r" = ":edit<CR>";
          "<leader>b" = "<C-^>";

           # Harpoon keymaps
          "<leader>a" = ":lua require('harpoon.mark').add_file()<CR>";
          "<leader>m" = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
          "<leader>1" = ":lua require('harpoon.ui').nav_file(1)<CR>";
          "<leader>2" = ":lua require('harpoon.ui').nav_file(2)<CR>";
          "<leader>3" = ":lua require('harpoon.ui').nav_file(3)<CR>";
          "<leader>4" = ":lua require('harpoon.ui').nav_file(4)<CR>";
          "<leader>5" = ":lua require('harpoon.ui').nav_file(5)<CR>";
          "<leader>6" = ":lua require('harpoon.ui').nav_file(6)<CR>";
          "<leader>7" = ":lua require('harpoon.ui').nav_file(7)<CR>";
          "<leader>8" = ":lua require('harpoon.ui').nav_file(8)<CR>";
          "<leader>9" = ":lua require('harpoon.ui').nav_file(9)<CR>";
          "<leader>0" = ":lua require('harpoon.ui').nav_file(0)<CR>";

          # obsidian
          "<A-i>" = ":ObsidianTemplate<CR>";
          "<leader>op" = ":ObsidianPasteImg<CR>";

          # Existing keymaps
          "<C-e>" = ":Neotree toggle<CR>";
          "<esc>" = ":noh<CR>";
          "Y" = "y$";
          "<C-c>" = ":b#<CR>";
          "<C-x>" = ":close<CR>";
          "<C-s>" = ":w<CR>";
          "<leader>h" = "<C-w>h";
          "<leader>j" = "<C-w>j";
          "<leader>k" = "<C-w>k";
          "<leader>l" = "<C-w>l";
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+<CR>";
        };

      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {

          # Obsidian visual mode keymap
          "<leader>ot" = ":!column -t -s '|' -o '|'<CR>";

          # Move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
          "<Esc>" = ":normal! zz<CR>";
        };

      insert =
        lib.mapAttrsToList
        (key: action: {
          mode = "i";
          inherit action key;
        })
        {
          "<C-c>" = "<Esc>";
          "<Esc>" = "<Esc>:normal! zz<CR>";
        };

    in
      config.nixvim.helpers.keymaps.mkKeymaps
      { options.silent = true; }
      (normal ++ visual ++ insert);
  };
}
