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
      # background #151515
      # background #1E1E2E
      background #0f1c21

color0  #2E3440
color1  #BF616A
color2  #94E2D5
color3  #EBCB8B
color4  #81A1C1
color5  #B48EAD
color6  #88C0D0
color7  #E5E9F0

color8  #4C566A
color9  #BF616A
color10  #94E2D5
color11 #EBCB8B
color12 #81A1C1
color13 #B48EAD
color14 #8FBCBB
color15 #ECEFF4

      # color0  #45475A
      # color1  #F38BA8
      # color2  #A6E3A1
      # color3  #F9E2AF
      # color4  #89B4FA
      # color5  #CBA6F7
      # color6  #94E2D5
      # color7  #BAC2DE
      #
      # color8  #585B70
      # color9  #F38BA8
      # color10 #A6E3A1
      # color11 #F9E2AF
      # color12 #89B4FA
      # color13 #CBA6F7
      # color14 #94E2D5
      # color15 #A6ADC8
    '';
  };
}

