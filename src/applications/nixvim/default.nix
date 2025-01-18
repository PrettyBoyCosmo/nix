{ inputs, lib, ... }:
let
  inherit (inputs.haumea.lib)
    load
    loaders
    ;

  inherit (lib)
    collect
    isAttrs
    ;
in
{
  flake.nixosModules.nixvim.imports = collect
    (x: !(isAttrs x))
    (load {
      src = ./nixos;
      loader = loaders.path;
    });
}
