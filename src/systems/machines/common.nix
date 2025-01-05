{ inputs, ... }:

{
  flake = {
    homeModules.common.imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];

    nixosModules.common = {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
        inputs.home-manager.nixosModules.home-manager
        inputs.nixvim.nixosModules.nixvim
      ];

      nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
