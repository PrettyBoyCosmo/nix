{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    catppuccin = {
      enable = true;
      accent = "sky";
      flavor = "mocha";
    };

    settings = {
      "$alt" = "ALT";
      "$win" = "SUPER";

      monitor = [
        "eDP-1, 1920x1080@90, 0x0, 1"
        "DP-5, 1920x1080@90, -1920x0, 1" # left
        # "DP-5, 1920x1080@90, 0x1920, 1" # right
        # "DP-5, 1920x1080@90, 0x-1080, 1" # above
        # "DP-5, 1920x1080@90, 1080x0, 1" # below
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us";
        # kb_variant = "lang";
        # kb_options = "grp:alt_space_toggle";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(ffffffee) rgba(ffffffee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to alt + P in the keybinds section below
        preserve_split = true; # you probably want this
      };
      #
      # master = {
      #   new_is_master = true;
      # };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
        "opacity 0.85, kitty"   # This makes only Kitty 85% opaque
      ];

      exec-once = [
        "swww init"
        "swww img ~/media/photos/wallpapers/opensource.png"
        "duplicati-server"
        "waybar"
        "nm-applet"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # keybinds
      bind = [

        # applications
        "$win, D, exec, discord"
        "$win, E, exec, nemo"
        "$win, F, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$win, O, exec, obsidian"
        "$win, O, exec, spotify"
        "$win, V, exec, firefox --ProfileManager"
        "$win, Q, exec, virt-manager"

        "$win, L, exec, swaylock"
        "$alt, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$alt, Return, exec, kitty"
        "$alt SHIFT, Q, killactive,"
        "$alt SHIFT, E, exit,"
        "$alt SHIFT, SPACE, togglefloating,"
        "$alt, S, exec, wofi --show drun"
        "$alt, P, pseudo, # dwindle"
        "$alt, T, togglesplit, # dwindle"
        "$alt, F, fullscreen"

        # Move focus with alt + arrow keys
        "$alt, h, movefocus, l"
        "$alt, l, movefocus, r"
        "$alt, k, movefocus, u"
        "$alt, j, movefocus, d"

        # Moving windows
        "$alt SHIFT, left,  swapwindow, l"
        "$alt SHIFT, right, swapwindow, r"
        "$alt SHIFT, up,    swapwindow, u"
        "$alt SHIFT, down,  swapwindow, d"
        "$alt SHIFT, h,  swapwindow, l"
        "$alt SHIFT, l, swapwindow, r"
        "$alt SHIFT, k,    swapwindow, u"
        "$alt SHIFT, j,  swapwindow, d"

        # Window resizing                     X  Y
        # "$alt CTRL, left,  resizeactive, -60 0"
        # "$alt CTRL, right, resizeactive,  60 0"
        # "$alt CTRL, up,    resizeactive,  0 -60"
        # "$alt CTRL, down,  resizeactive,  0  60"
        # "$alt CTRL, h,  resizeactive, -60 0"
        # "$alt CTRL, l, resizeactive,  60 0"
        # "$alt CTRL, k,    resizeactive,  0 -60"
        # "$alt CTRL, j,  resizeactive,  0  60"
        "$alt CTRL SHIFT, left,  resizeactive, -60 0"
        "$alt CTRL SHIFT, right, resizeactive,  60 0"
        "$alt CTRL SHIFT, up,    resizeactive,  0 -60"
        "$alt CTRL SHIFT, down,  resizeactive,  0  60"
        "$alt CTRL SHIFT, h,  resizeactive, -60 0"
        "$alt CTRL SHIFT, l, resizeactive,  60 0"
        "$alt CTRL SHIFT, k,    resizeactive,  0 -60"
        "$alt CTRL SHIFT, j,  resizeactive,  0  60"

        # Switch workspaces with alt + [0-9]
        "$alt, 1, workspace, 1"
        "$alt, 2, workspace, 2"
        "$alt, 3, workspace, 3"
        "$alt, 4, workspace, 4"
        "$alt, 5, workspace, 5"
        "$alt, 6, workspace, 6"
        "$alt, 7, workspace, 7"
        "$alt, 8, workspace, 8"
        "$alt, 9, workspace, 9"
        "$alt, 0, workspace, 10"

        # Move active window to a workspace with alt + SHIFT + [0-9]
        "$alt SHIFT, 1, movetoworkspacesilent, 1"
        "$alt SHIFT, 2, movetoworkspacesilent, 2"
        "$alt SHIFT, 3, movetoworkspacesilent, 3"
        "$alt SHIFT, 4, movetoworkspacesilent, 4"
        "$alt SHIFT, 5, movetoworkspacesilent, 5"
        "$alt SHIFT, 6, movetoworkspacesilent, 6"
        "$alt SHIFT, 7, movetoworkspacesilent, 7"
        "$alt SHIFT, 8, movetoworkspacesilent, 8"
        "$alt SHIFT, 9, movetoworkspacesilent, 9"
        "$alt SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with alt + scroll
        "$alt, mouse_down, workspace, e+1"
        "$alt, mouse_up, workspace, e-1"

        # Keyboard backlight
        "$alt, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$alt, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "
        # Waybar
        "$alt, B, exec, pkill -SIGUSR1 waybar"
        "$alt, W, exec, pkill -SIGUSR2 waybar"

      ];

      # Move/resize windows with alt + LMB/RMB and dragging
      bindm = [
        "$alt, mouse:272, movewindow"
        "$alt, mouse:273, resizewindow"
      ];
    };
  };
}
