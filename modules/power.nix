{ config, pkgs, ... }:

{
  # Enable better CPU scheduling
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Enable TLP for power management
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  # Disable GNOME's power manager
  services.power-profiles-daemon.enable = false;

  # Enable powertop for better power tracking
  powerManagement.powertop.enable = true;

  # Enable thermald (for Intel CPUs)
  services.thermald.enable = true;
}

