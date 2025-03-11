{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # === GUI APPLICATIONS ===
    firefox
    librewolf
    brave
    tor-browser
    discord
    anki
    libreoffice-qt6-fresh
    obsidian
    xournalpp
    zathura
    audacity
    gimp
    kdenlive
    obs-studio
    spotify
    spotify-player
    vlc

    # === DISPLAY UTILITIES ===
    adapta-gtk-theme
    brightnessctl
    feh
    ffmpeg
    flameshot
    ueberzugpp

    # === WAYLAND ===
    hyprland
    swaylock
    xwayland
    polybar
    waybar
    wofi
    slurp
    swww
    grim
    seatd
    wdisplays

    # === XORG ===
    rofi
    rofimoji
    stalonetray
    acpi
    numlockx
    xclip
    xdotool
    xorg.xdpyinfo
    arandr
    autorandr
    lxappearance
    picom
    xorg.xrandr
    i3
    i3status
    i3lock
    i3lock-fancy
    i3blocks
  ];
}

