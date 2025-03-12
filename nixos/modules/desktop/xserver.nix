{
  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.lightdm.enable = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "bluecosmo";
    desktopManager.cinnamon.enable = true; # disable for auto i3
    windowManager.i3.enable = true;
    displayManager.defaultSession = "none+i3";
    };
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";

  };
}
