{
  description = "My system configuration";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    {
      systems = [ "x86_64-liunx" ];

      flake = {
        nixosConfigurations.ccs = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./nixos/configuration.nix
            inputs.nixvim.nixosModules.nixvim
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };

        homeConfigurations.bluecosmo =
          inputs.home-manager.lib.homeManagerConfiguration {
            # FIXME: transpose homeConfigurations to access pkgs
            pkgs = import inputs.nixpkgs {
              system = "x86_64-liunx";
              config.allowUnfree = true;
            };

            modules = [
              ./home-manager/home.nix
              inputs.catppuccin.homeManagerModules.catppuccin
            ];
          };
      };
    };
}
