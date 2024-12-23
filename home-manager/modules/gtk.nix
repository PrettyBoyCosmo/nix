{
  gtk = {
    enable = true;

    theme = "Adapta-Nokto"; # Set the GTK theme name
    iconTheme = "Papirus-Dark"; # Set the GTK icon theme name
  };

  # Cursor settings, separate from GTK
  xsession = {
    cursor = {
      theme = "GoogleDot-White";
      size = 24;
    };
  };
}

# {
#   gtk = {
#     enable = true;
#     catppuccin.accent = "sky";
#     catppuccin.flavor = "mocha";
#     catppuccin.size = "standard";
#     catppuccin.tweaks = "black";
#
#     catppuccin.icon = {
#       enable = true;
#       accent = "mauve";
#       flavor = "mocha";
#     };
#   };
# }
