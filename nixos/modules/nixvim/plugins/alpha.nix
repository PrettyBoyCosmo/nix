{
  programs.nixvim.plugins.alpha = {
    enable = true;

    layout = [
      {
        type = "text";
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        val = [
          ""
          "  ██████╗ ██████╗ ███████╗███╗   ███╗ ██████╗ ██████╗ ██╗██╗   ██╗███╗   ███╗ ██████╗███████╗ "
          " ██╔════╝██╔═══██╗██╔════╝████╗ ████║██╔═══██╗██╔══██╗██║██║   ██║████╗ ████║██╔════╝██╔════╝ "
          " ██║     ██║   ██║███████╗██╔████╔██║██║   ██║██║  ██║██║██║   ██║██╔████╔██║██║     ███████╗ "
          " ██║     ██║   ██║╚════██║██║╚██╔╝██║██║   ██║██║  ██║██║██║   ██║██║╚██╔╝██║██║     ╚════██║ "
          " ╚██████╗╚██████╔╝███████║██║ ╚═╝ ██║╚██████╔╝██████╔╝██║╚██████╔╝██║ ╚═╝ ██║╚██████╗███████║ "
          "  ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝╚══════╝ "
          ""
          "              Malware Development  Offensive Development  Payload Development             "
          # "             • Malware Development • Offensive Development • Payload Development •            "
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            type = "button";
            # val = "📄 • New File";
            val = " • New File";
            opts = {
              hl = "AlphaButton";
              shortcut = "n";
              keymap = [ "n" "n" ":ene <BAR> startinsert <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "📁 • Open File";
            val = " • Open File";
            opts = {
              hl = "AlphaButton";
              shortcut = "o";
              keymap = [ "n" "o" ":Telescope find_files <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "🪨 • Obsidian Vault";
            val = " • Obsidian Vault";
            opts = {
              hl = "AlphaButton";
              shortcut = "v";
              keymap = [ "n" "v" ":lua require('telescope.builtin').find_files({ cwd = '~/obsidian' }) <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "👀 • Recently Used";
            val = " • Recently Used";
            opts = {
              hl = "AlphaButton";
              shortcut = "r";
              keymap = [ "n" "r" ":Telescope oldfiles <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "🔎 • Find Text";
            val = " • Find Text";
            opts = {
              hl = "AlphaButton";
              shortcut = "f";
              keymap = [ "n" "f" ":Telescope live_grep <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "🤖 • Edit Config";
            val = " • Edit Config";
            opts = {
              hl = "AlphaButton";
              shortcut = "e";
              keymap = [ "n" "e" ":e ~/nix/nixos/modules/nixvim/nixvim.nix <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
          {
            type = "button";
            # val = "🙈 • Quit NeoVim";
            val = " • Quit NeoVim";
            opts = {
              hl = "AlphaButton";
              shortcut = "q";
              keymap = [ "n" "q" ":qa <CR>" {} ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "AlphaButtonShortcut";
            };
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "AlphaFooter";
          position = "center";
        };
        type = "text";
        # val = "🐂 NeoVim";
        val = " NeoVim";
      }
    ];
  };
}

