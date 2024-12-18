{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

    # apps
    audacity
    obsidian
    duplicati
    firefox
    gimp
    kitty
    obs-studio
    wofi
    kdenlive
    spotify
    spotify-player
    vlc

    # coding / hacking / ccs
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

    # cli tooling
    bat
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

    # gui tooling
    gobject-introspection
    flameshot
    swaylock
    feh

    # wm
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
    
    # system
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
