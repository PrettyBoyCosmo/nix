{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

    # === APPS ===
    # -- browsers --
    firefox
    tor-browser
    # -- fun --
    discord
    # -- office --
    anki
    libreoffice-qt6-fresh
    obsidian
    xournalpp
    zathura
    # -- media --
    audacity
    gimp
    kdenlive
    obs-studio
    spotify
    spotify-player
    vlc

    # === UTILITIES ===
    # -- audio --
    pamixer
    pipewire
    pulseaudio
    wireplumber
    # -- display --
    adapta-gtk-theme
    brightnessctl
    # -- files --
    bat
    duplicati
    eza
    file
    fzf
    p7zip
    ripgrep
    tree
    unzip
    zoxide
    # -- image --
    feh
    ffmpeg
    flameshot
    # -- system --
    busybox
    fastfetch
    htop
    home-manager
    kitty
    tmux
    xonsh
    # -- network --
    cups
    curl
    openvpn
    tor
    wget
    # -- vritualization --
    libvirt
    qemu
    spice-vdagent
    virt-manager

    # === DEVELOPMENT ===
    # -- editors --
    neovim
    vim
    # -- debugging --
    gdb
    gef
    pwndbg
    valgrind
    # -- libraries --
    stripe-cli
    gobject-introspection
    # -- c --
    gcc
    clang
    # -- tools --
    git
    # -- python --
    python3
    pipx
    python312Packages.cli-helpers
    python312Packages.netifaces
    python312Packages.pip
    # (python3.withPackages (ps: with ps; [ requests ]))
    # -- man pages --
    linux-manual
    man-pages
    man-pages-posix
    # -- hacking --
    ropgadget
    nmap
    ghidra
    wireshark
    gobuster
    netcat-openbsd
    thc-hydra
    john
    sqlmap
    ffuf
    aircrack-ng
    metasploit
    social-engineer-toolkit

    # -- sdr --
    pkg-config
    rtl-sdr
    rtl-sdr-librtlsdr
    sdrpp

    # === XORG ===
    # -- applications --
    rofi
    stalonetray
    # -- tools --
    acpi # battery status
    numlockx
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
