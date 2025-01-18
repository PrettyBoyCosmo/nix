{ config, lib, ... }:
let
  inherit (config.flake.types) hybridModule;
  inherit (lib)
    mkOption
    types
    ;
in
{
  options.flake = {
    hardwareModules = mkOption {
      type = with types; attrsOf deferredModule;
      default = { };
    };

    homeModules = mkOption {
      type = with types; attrsOf deferredModule;
      default = { };
    };

    hostModules = mkOption {
      type = with types; attrsOf hybridModule;
      default = { };
    };

    lib = mkOption {
      type = with types; attrsOf (functionTo unspecified);
      default = { };
    };

    transposeModules = mkOption {
      type = with types; attrsOf deferredModule;
      default = { };
    };

    types = mkOption {
      type = with types; attrsOf optionType;
      default = { };
    };

    userModules = mkOption {
      type = with types; attrsOf hybridModule;
      default = { };
    };
  };
}
