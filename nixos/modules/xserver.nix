{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    layout = "us";
    xkbVariant = "";

    inputClassSections = [
      ''
        Identifier "UNIW Touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "NaturalScrolling" "false"
        Option "ScrollMethod" "twofinger"
      ''
    ];
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
