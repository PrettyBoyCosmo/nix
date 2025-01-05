{ lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;
in
{
  options = {
    flake = {
      transposeModules = mkOption {
        type = with types; attrsOf deferredModule;
        default = { };
      };
    };
  };
}
