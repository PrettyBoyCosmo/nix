{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
    pkg-config
    rtl-sdr-librtlsdr
    sdrpp
    rtl-sdr
    spicetify-cli
    nitrogen
    xorg.xdpyinfo
    xclip
    autorandr
    acpi
    stalonetray
    arandr
    lxappearance
    numlockx
    xorg.xrandr
    xdotool
    libnotify
    audacity
    anki
    busybox
    duplicati
    firefox
    gimp
    kitty
    kdenlive
    obsidian
    obs-studio
    wofi
    rofi
    spotify
    spotify-player
    tor-browser
    vlc
    neovim
    stripe-cli
    vim
    nmap
    gcc
    gdb
    gef
    clang
    ghidra
    python3
    pipx
    python312Packages.cli-helpers
    python312Packages.netifaces
    python312Packages.pip
    wireshark
    valgrind
    xonsh
    linux-manual
    man-pages
    man-pages-posix
    # (python3.withPackages (ps: with ps; [ requests ]))
    bat
    tor
    p7zip
    openvpn
    grim
    eza
    zoxide
    slurp
    file
    tree
    fzf
    curl
    git
    ripgrep
    fastfetch
    htop
    ffmpeg
    tmux
    unzip
    brightnessctl
    wget
    qemu
    virt-manager
    libvirt
    gobject-introspection
    flameshot
    swaylock
    feh
    adapta-gtk-theme
    swww
    xwayland
    wl-clipboard
    cliphist
    hyprland
    seatd
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-utils
    vesktop
    polybar
    waybar
    cups
    pipewire
    wireplumber
    wdisplays
    pulseaudio
    pamixer
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    i3
    i3status
    i3lock
    i3lock-fancy
    i3blocks  # Optional for a more customizable bar
    picom
  ];

  fonts.packages = with pkgs; [
    # jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    cascadia-code
    # twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    # (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
  }
