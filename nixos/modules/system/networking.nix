{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;
  services.syncthing.enable = true;
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };
}
