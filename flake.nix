{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
        catppuccin.url = "github:catppuccin/nix";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, home-manager, catppuccin, ... }@inputs: 

		let
			system = "x86_64-linux";
		in {

		nixosConfigurations.ccs = nixpkgs.lib.nixosSystem {
			specialArgs = {
				pkgs-stable = import nixpkgs-stable {
					inherit system;
					config.allowUnfree = true;
				};

				inherit inputs system;
			};

			modules = [
				./nixos/configuration.nix
				inputs.nixvim.nixosModules.nixvim
                catppuccin.nixosModules.catppuccin
			];
		};

		homeConfigurations.bluecosmo = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [
              ./home-manager/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];

		};
	};
}
