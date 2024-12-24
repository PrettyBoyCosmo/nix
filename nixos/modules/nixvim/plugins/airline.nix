{ pkgs, ... }:

{
  programs.nixvim.plugins.airline = {
    enable = true;

    settings = {
      powerline_fonts = true;
      skip_empty_sections = true;
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

