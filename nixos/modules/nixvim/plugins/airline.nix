{ pkgs, ... }:

{
  programs.nixvim.plugins.airline = {
    enable = true;

    settings = {
      powerline_fonts = 1;
      skip_empty_sections = 1;
      # theme = "minimalist";
      # theme = "base16_atelier_lakeside";
      # theme = "base16";
      theme = "transparent";
    };
  };

  # Manually install vim-airline-themes plugin
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    vim-airline-themes
  ];
}

