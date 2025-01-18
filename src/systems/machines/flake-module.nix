{ config, flakeRoot, inputs, lib, ... }:
let
  inherit (config.flake.types) hybridModule;
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  inherit (inputs.nixpkgs.lib) nixosSystem;

  inherit (lib)
    attrValues
    flatten
    mapAttrs
    mapAttrsToList
    mkDefault
    mkMerge
    mkOption
    types
    ;

  mkMachine =
    { name
    , hardware
    , host
    , users ? { }
    , stateVersion
    , extraHomeManager ? { }
    , extraNixos ? { }
    }:
    {
      flake = {
        hardwareModules.${name} = hardware;
        hostModules.${name} = host;

        nixosConfigurations.${name} = nixosSystem {
          specialArgs = {
            inherit flakeRoot inputs;
            flakeConfig = config;
          };

          modules = flatten [
            inputs.home-manager.nixosModules.home-manager

            config.flake.nixosModules.default

            hardware
            host.nixos
            extraNixos

            (map (user: user.nixos) (attrValues users))

            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit flakeRoot inputs;
                  flakeConfig = config;
                };

                users = mapAttrs
                  (userName: user: {
                    imports = [
                      config.flake.homeModules.default

                      host.homeManager
                      user.homeManager
                      extraHomeManager
                    ];

                    programs.home-manager.enable = true;

                    home = {
                      inherit stateVersion;
                      username = mkDefault userName;
                      homeDirectory = mkDefault "/home/${userName}";
                    };
                  })
                  users;
              };

              system = { inherit stateVersion; };
            }
          ];
        };
      };

      perSystem = { pkgs, ... }: {
        homeConfigurations.${name} = mapAttrs
          (_: user: homeManagerConfiguration {
            inherit pkgs;

            extraSpecialArgs = {
              inherit flakeRoot inputs;
              flakeConfig = config;
            };

            modules = [
              config.flake.homeModules.default

              host.homeManager
              user.homeManager
              extraHomeManager
            ];
          })
          users;
      };
    };
in
{
  options.machines = mkOption {
    type = types.attrsOf (types.submodule ({ name, ... }: {
      options = {
        name = mkOption {
          type = types.str;
          default = name;
        };

        hardware = mkOption {
          type = types.deferredModule;
        };

        host = mkOption {
          type = hybridModule;
        };

        users = mkOption {
          type = types.attrsOf hybridModule;
          default = { };
        };

        stateVersion = mkOption {
          type = types.str;
        };

        extraHomeManager = mkOption {
          type = types.deferredModule;
          default = { };
        };

        extraNixos = mkOption {
          type = types.deferredModule;
          default = { };
        };
      };
    }));

    default = { };
  };

  config = {
    flake = mkMerge (mapAttrsToList
      (_: machine: (mkMachine machine).flake)
      config.machines);

    perSystem = mkMerge (mapAttrsToList
      (_: machine: (mkMachine machine).perSystem)
      config.machines);
  };
}
