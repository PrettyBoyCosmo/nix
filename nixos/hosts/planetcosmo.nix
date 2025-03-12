{ pkgs, ... }:

{
  networking.hostName = "planetcosmo";
  nixpkgs.config.allowBroken = true;

  # Users
  users.users.bluecosmo = {
    isNormalUser = true;
    home = "/home/bluecosmo";
    description = "Planet Cosmo User";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };

  # Services
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
    extraConfig = ''
      MACs hmac-sha2-512,hmac-sha2-256
    '';
  };
}
