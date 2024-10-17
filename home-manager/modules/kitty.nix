{
  home.file = {
    ".config/kitty/kitty.conf".text = ''
      font_family      Cascadia Code
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size        22.0
      disable_ligatures never
      clipboard_control write-clipboard write-primary no-append

      shell tmux
      editor nvim
      enable_audio_bell no

      map ctrl+shift+l send_text all clear\n

      foreground #CDD6F4
      background #151515
      # background #1E1E2E

      color0  #45475A
      color1  #F38BA8
      color2  #A6E3A1
      color3  #F9E2AF
      color4  #89B4FA
      color5  #CBA6F7
      color6  #94E2D5
      color7  #BAC2DE

      color8  #585B70
      color9  #F38BA8
      color10 #A6E3A1
      color11 #F9E2AF
      color12 #89B4FA
      color13 #CBA6F7
      color14 #94E2D5
      color15 #A6ADC8
    '';
  };
}

