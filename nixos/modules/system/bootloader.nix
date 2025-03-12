{

  # auto delete builds
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # rtl sdr (infor from dmesg)
  boot.blacklistedKernelModules = [ "dvb_usb_rtl28xxu" "rtl2832" "r820t" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="2838", GROUP="plugdev", MODE="0666"
  '';
}
