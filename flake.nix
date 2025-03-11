{
  description = "Cosmo's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixvim, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      # ✅ Bluecosmo - PC
      "bluecosmo" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/bluecosmo.nix
          ./modules/meta/all.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.bluecosmo = import ./home-manager/users/bluecosmo.nix;
          }
        ];
      };

      # ✅ Planetcosmo - Server
      "planetcosmo" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system home-manager; };
        modules = [
          ./hosts/planetcosmo.nix
          ./modules/hardware.nix  # ✅ Hardware detection (filesystem, etc.)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.planetcosmo = import ./home-manager/users/planetcosmo.nix;
          }
        ];
      };
    };

    # ✅ FIXED: New Home Manager Configuration (No Deprecated Args)
    homeConfigurations = {
      "bluecosmo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/users/bluecosmo.nix ];
      };

      "planetcosmo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/users/planetcosmo.nix ];
      };
    };
  };
}

