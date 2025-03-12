{
  description = "Cosmo's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # Server
    nixosConfigurations.planetcosmo = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/hosts/hardware-configuration.nix
        ./nixos/hosts/planetcosmo.nix
        ./nixos/modules/system/all.nix
        ./nixos/modules/packages/cybersecurity.nix
        ./nixos/modules/packages/development.nix
        ./nixos/modules/packages/server.nix
        ./nixos/modules/packages/utilities.nix
        ./nixos/modules/packages/virt.nix
      ];
    };

    # Host
    nixosConfigurations.ccs = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/hosts/hardware-configuration.nix
        ./nixos/hosts/bluecosmo.nix
        ./nixos/modules/system/all.nix
        ./nixos/modules/desktop/xserver.nix
        ./nixos/modules/packages/cybersecurity.nix
        ./nixos/modules/packages/desktop.nix
        ./nixos/modules/packages/development.nix
        ./nixos/modules/packages/fonts.nix
        ./nixos/modules/packages/utilities.nix
        ./nixos/modules/packages/virt.nix
      ];
    };

    homeConfigurations."ccs" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home-manager/home.nix
        ./home-manager/users/bluecosmo.nix
      ];
    };

  };
}
