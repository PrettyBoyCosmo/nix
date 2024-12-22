{
  gtk = {
    enable = true;

    settings = {
        "org.gnome.desktop.interface" = {
          gtk-theme = "Adapta-Nokto";
        # icon-theme = "Adapta";
        # cursor-theme = "Adwaita";
      };
    };

    catppuccin.accent = "sky";
    catppuccin.flavor = "mocha";
    catppuccin.size = "standard";
    catppuccin.tweaks = "black";

    catppuccin.icon = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };
  };
}
