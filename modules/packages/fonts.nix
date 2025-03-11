{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    cascadia-code
    font-awesome
    powerline-fonts
    powerline-symbols
  ];
}

