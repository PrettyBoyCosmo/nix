{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<C-o>" = "find_files";
      "<C-f>" = "live_grep";
      # "<leader>b" = "buffers";
      # "<leader>fh" = "help_tags";
      # "<leader>gf" = "git_files";
      # "<leader>of" = "oldfiles";
      # "<leader>fd" = "diagnostics";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.env/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
