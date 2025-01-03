{ pkgs ? import <nixpkgs> { } }:

(pkgs.buildFHSEnv {
  name = "fhs";
  targetPkgs = pkgs: (with pkgs; [
    pkgsi686Linux.glibc
    pkgsi686Linux.stdenv.cc.cc.lib
  ]) ++ (with pkgs.xorg; [
    libX11
    libXcursor
    libXrandr
  ]);
  multiPkgs = pkgs: (with pkgs; [
    pkgsi686Linux.glibc
    pkgsi686Linux.stdenv.cc.cc.lib
  ]);
  runScript = "xonsh";
}).env
