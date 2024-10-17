{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    # displayManager = {
    #   autoLogin.enable = true;
    #   autoLogin.user = "amper";
    #   lightdm.enable = true;
    # };

    layout = "us";
    xkbVariant = "";

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    # videoDrivers = [ "amdgpu" ];
    videoDrivers = [ "intel" ];
    deviceSection = ''Option "TearFree" "True"'';
    # displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = trueamper;
    # boot.kernelParams = [ "i915.force_probe=4c8a" ];
    # boot.kernelPackages = pkgs.linuxPackages_5_11;
  };
}
