{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # === APPS ===
    # -- browsers --
    firefox
    librewolf
    tor-browser
    # -- fun --
    discord
    # -- office --
    anki
    libreoffice-qt6-fresh
    obsidian
    vscodium-fhs
    xournalpp
    zathura
    # -- media --
    audacity
    gimp
    kdePackages.kdenlive
    obs-studio
    spotify
    vlc

    # === DESKTOP UTILITIES ===
    # -- audio --
    pamixer
    pipewire
    pulseaudio
    wireplumber
    # -- display --
    adapta-gtk-theme
    brightnessctl
    # -- image --
    feh
    flameshot

    # === XORG ===
    # -- applications --
    rofi
    rofimoji
    stalonetray
    # -- tools --
    acpi # battery status numlockx
    xclip
    xdotool # keyboard simul
    xorg.xdpyinfo # info on xserver
    # -- display --
    arandr
    autorandr
    lxappearance
    picom
    xorg.xrandr
    # --- i3 ---
    i3
    i3status
    i3lock
    i3lock-fancy
    i3blocks

    # === WAYLAND ===
    # -- clipboard --
    wl-clipboard
    cliphist
    # -- hyprland --
    hyprland
    swaylock
    xwayland
    polybar
    # -- imaging --
    slurp
    swww
    grim
    # -- theme --
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    waybar
    wofi
    # -- utilities --
    seatd
    wdisplays
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-utils
  ];
}

