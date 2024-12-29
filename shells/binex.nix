{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.gdb
    pkgs.glibc
    pkgs.patchelf
    pkgs.strace
  ];
}

