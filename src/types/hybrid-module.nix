{ lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
in
{
  flake.types.hybridModule = types.submodule {
    options = {
      homeManager = mkOption {
        type = types.deferredModule;
        default = { };
      };

      nixos = mkOption {
        type = types.deferredModule;
        default = { };
      };
    };
  };
}
