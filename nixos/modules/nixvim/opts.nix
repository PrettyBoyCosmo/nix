{
  programs.nixvim = {

    # clipboard = {
    #   register = "unnamedplus";
    #   providers.wl-copy.enable = true;
    # };

    opts = {
      updatetime = 100; # Faster completion
      shell = "/home/bluecosmo/.nix-profile/bin/bash";

      relativenumber = true; # Relative line numbers
      number = true; # Display the absolute line number of the current line

      hidden = true; # Keep closed buffer open in the background

      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection

      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one

      conceallevel = 1;

      swapfile = false; # Disable the swap file

      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines

      undofile = false; # Automatically save and restore undo history
      backup = false; # Automatically save and restore undo history

      incsearch = true; # Incremental search: show match for partly typed search command
      hlsearch = false;

      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper

      scrolloff = 8; # Number of screen lines to show around the cursor

      cursorline = false; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = "80"; # Columns to highlight

      laststatus = 3; # When to use a status line for the last window

      fileencoding = "utf-8"; # File-content encoding for the current buffer

      termguicolors = true; # Disables 24-bit RGB color in the |TUI|

      spell = true; # Highlight spelling mistakes (local to window)
      wrap = true; # Prevent text from wrapping

      tabstop = 4; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 4; # Number of spaces used for each step of (auto)indent (local to buffer)
      softtabstop = 4;
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting
      smartindent = true;
      smarttab = true;
      linebreak = true;

      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be

      foldlevel = 99; # Folds with a level higher than this number will be closed

      # guifont = "Cascadia Code";

      completeopt = ["menu" "menuone" "noselect"]; # For CMP plugin
    };
  };
}
