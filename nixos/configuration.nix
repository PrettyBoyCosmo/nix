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

  # man pages and docs
  documentation.enable = true;
  documentation.dev.enable = true;
  documentation.man.enable = true;

  # bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Better scheduling for CPU cycles - thanks System76!!!
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Enable TLP (better than gnomes internal power manager)
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  # Disable GNOMEs power management
  services.power-profiles-daemon.enable = false;

  # Enable powertop
  powerManagement.powertop.enable = true;

  # Enable thermald (only necessary if on Intel CPUs)
  services.thermald.enable = true;

  # services 
  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.lightdm.enable = true;
    # displayManager.autoLogin.enable = true;
    # displayManager.autoLogin.user = "bluecosmo";
    desktopManager.cinnamon.enable = true; # disable for auto i3
    windowManager.i3.enable = true;
    displayManager.defaultSession = "none+i3";

    # displayManager = {
    #   lightdm.enable = true;
    #   lightdm.greeter = {
    #     enable = true;
    #     allow-session-switching = false;
    #   };
    #   defaultSession = "none+i3";
    # };
  };


  services.tailscale.enable = true;
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };

  # bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
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
