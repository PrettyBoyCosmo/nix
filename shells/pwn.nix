{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    xonsh
    python312
    python312Packages.virtualenv  # Add venv to create Python virtual environments
    python312Packages.netifaces

    pwntools
    gdb
    gef
    pwndbg
    ropgadget
  ];

  shellHook = ''
    # Create a virtual environment in your home directory if it doesn't exist
    if [ ! -d "$HOME/.venv/xonsh" ]; then
      python3 -m venv $HOME/.venv/xonsh
      source $HOME/.venv/xonsh/bin/activate
      pip install xontrib-vox
    else
      source $HOME/.venv/xonsh/bin/activate
    fi
  '';
}

