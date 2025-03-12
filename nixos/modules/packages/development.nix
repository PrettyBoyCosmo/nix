{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # === EDITORS ===
    neovim
    vim

    # === DEBUGGING TOOLS ===
    gdb
    gef
    valgrind

    # === COMPILERS ===
    gcc
    clang
    clang-tools
    zulu23  # Java

    # === LUA ===
    lua
    luarocks
    imagemagick
    luajit
    lua51Packages.magick

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

