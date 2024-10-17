{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.bash;

    users.bluecosmo = {
      isNormalUser = true;
      description = "bluecosmo";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [];
    };
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "bluecosmo";
}
