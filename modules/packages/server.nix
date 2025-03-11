{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # === SERVER UTILITIES ===
    vim
    neofetch
    openvpn
    sshfs
    tor
    cups
  ];
}

