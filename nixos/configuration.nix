{ inputs, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/all.nix
  ];

  # auto delete builds
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # services
  services.xserver.enable = true;
  services.tailscale.enable = true;
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.blueman.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };


  disabledModules = [
    ./modules/xserver.nix
  ];

  networking.hostName = "ccs";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  system.stateVersion = "24.05"; # DON'T CHANGE
}
