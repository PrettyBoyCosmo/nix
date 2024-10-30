{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    xonsh
    python312
    python312Packages.virtualenv
    python312Packages.netifaces
  ];

  shellHook = ''
    if [ ! -d "$HOME/.venv/xonsh" ]; then
      python3 -m venv $HOME/.venv/xonsh
      source $HOME/.venv/xonsh/bin/activate
      pip install xontrib-vox
    else
      source $HOME/.venv/xonsh/bin/activate
    fi
  '';
}

