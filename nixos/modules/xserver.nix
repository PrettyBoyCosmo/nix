{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    layout = "us";
    xkbVariant = "";

    inputClassSections = [
      {
        identifier = "UNIW Touchpad";
        matchIsTouchpad = "on";
        driver = "libinput";
        option = [
          "NaturalScrolling"
          "false" # Disable natural scrolling
          "ScrollMethod"
          "twofinger" # Ensure two-finger scrolling
        ];
      }
    ];

    videoDrivers = [ "intel" ];
  };
}
# {
#   services.xserver = {
#     enable = true;
#     windowManager.herbstluftwm.enable = true;
#
#     # displayManager = {
#     #   autoLogin.enable = true;
#     #   autoLogin.user = "amper";
#     #   lightdm.enable = true;
#     # };
#
#     layout = "us";
#     xkbVariant = "";
#
#     inputClassSections = [{
#         identifier = "Touchpad Reverse Scrolling";
#         matchDriver = "libinput";
#         option = "NaturalScrolling" "false";
#     }];
#
#     libinput = {
#       enable = true;
#       mouse.accelProfile = "flat";
#       touchpad.accelProfile = "flat";
#     };
#
#     # videoDrivers = [ "amdgpu" ];
#     videoDrivers = [ "intel" ];
#     deviceSection = ''Option "TearFree" "True"'';
#     # displayManager.gdm.enable = true;
#     # desktopManager.gnome.enable = trueamper;
#     # boot.kernelParams = [ "i915.force_probe=4c8a" ];
#     # boot.kernelPackages = pkgs.linuxPackages_5_11;
#   };
# }
