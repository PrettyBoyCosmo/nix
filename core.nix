{ config, inputs, lib, ... }:
let
  inherit (lib)
    attrNames
    attrValues
    collect
    concatMap
    filterAttrs
    isAttrs
    listToAttrs
    mapAttrsRecursiveCond
    nameValuePair
    ;

  inherit (inputs.haumea.lib)
    load
    loaders
    ;

  combineModules = modules: {
    imports = attrValues (filterAttrs (k: _: k != "default") modules);
  };

  filterAttrsRecursive' =
    pred:
    set:
    listToAttrs (
      concatMap
        (name:
        let v = set.${name}; in
        if pred set name v then [
          (nameValuePair name (
            if isAttrs v then filterAttrsRecursive' pred v
            else v
          ))
        ] else [ ])
        (attrNames set)
    );

  flakeModules =
    let
      modules = mapAttrsRecursiveCond
        (as: !(as ? default))
        (_: module:
          if isAttrs module
          then module.default
          else module)
        (filterAttrsRecursive'
          (set: name: _:
            !(set ? default && name != "default"))
          (load {
            src = ./src;
            loader = loaders.path;
          }));
    in
    modules // {
      default.imports = collect (module: !(isAttrs module)) modules;
    };
in
{
  imports = [ flakeModules.default ];

  config = {
    flake = {
      inherit flakeModules;

      homeModules.default = combineModules config.flake.homeModules;
      nixosModules.default = combineModules config.flake.nixosModules;
      transposeModules.default = combineModules config.flake.transposeModules;
    };
  };
}
