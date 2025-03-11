{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # === SYSTEM UTILITIES ===
    bat
    eza
    file
    fzf
    home-manager
    p7zip
    ripgrep
    tree
    unzip
    zoxide
    fastfetch
    htop
    tmux
    xonsh
    curl
    wget
    git
    sqlite
    ltrace
    strace
  ];
}

