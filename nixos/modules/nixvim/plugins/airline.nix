{ pkgs, ... }:

{
  programs.nixvim.plugins.airline = {
    enable = true;

    settings = {
      powerline_fonts = true;
      skip_empty_sections = true;
      # theme = "minimalist";  # Set your desired theme here
      theme = "base16";  # Set your desired theme here
    };
  };

  # Manually install vim-airline-themes plugin
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    vim-airline-themes
  ];
}

