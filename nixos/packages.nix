{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

# apps
obsidian
duplicati
firefox
kitty
obs-studio
wofi
kdenlive
discord
spotify
spotify-player

# coding / hacking / ccs
neovim
vim
gcc
clang
ghidra
python3
pipx
python312Packages.cli-helpers
python312Packages.netifaces
python312Packages.pip
valgrind
xonsh
# (python3.withPackages (ps: with ps; [ requests ]))

# cli tooling
bat
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

# gui tooling
    gsettings
gobject-introspection
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
xdg-desktop-portal-hyprland
polybar
waybar

# system
cups
pipewire
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
