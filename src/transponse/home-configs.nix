{ flake-parts-lib, lib, ... }:
let
  inherit (lib)
    mkOption
    types
    ;

  inherit (flake-parts-lib)
    mkTransposedPerSystemModule
    ;

  module = mkTransposedPerSystemModule {
    file = ./home-configs.nix;
    name = "homeConfigurations";
    option = mkOption {
      type = with types; attrsOf (attrsOf unspecified);
      default = { };
    };
  };
in
{
  imports = [ module ];

  flake.transposeModules.homeConfigs = module;
}
