{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # === EDITORS ===
    vscodium-fhs
    neovim
    vim

    # === DEBUGGING TOOLS ===
    gdb
    gef
    valgrind

    # === COMPILERS ===
    gcc
    clang
    zulu23  # Java

    # === PYTHON ===
    python3
    pipx
    python312Packages.cli-helpers
    python312Packages.netifaces
    python312Packages.pip

    # === LIBRARIES ===
    stripe-cli
    gobject-introspection
  ];
}

