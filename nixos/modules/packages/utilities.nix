{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

    # === SYSTEM UTILITIES ===
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
    ffmpeg
    ueberzugpp
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
    sshfs
    tor
    wget

    # ???
    git
    sqlite
    ltrace
    strace
  ];
}

