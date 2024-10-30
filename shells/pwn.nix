{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    xonsh
    python312
    python312Packages.virtualenv
    python312Packages.netifaces

    # binex
    pwntools
    gdb
    gef
    pwndbg
    ropgadget

    # cno
    wireshark
    gobuster
    nmap
    netcat-openbsd
    thc-hydra
    john
    sqlmap
    ffuf
    aircrack-ng
    metasploit
    social-engineer-toolkit

  ];

  shellHook = ''
    if [ ! -d "$HOME/.venv/pwn" ]; then
      python3 -m venv $HOME/.venv/xonsh
      source $HOME/.venv/xonsh/bin/activate
      pip install xontrib-vox
    else
      source $HOME/.venv/xonsh/bin/activate
    fi
  '';
}

