{ config, pkgs, ... }:

{
  # Enable Waybar
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        margin-left = 4;
        margin-right = 0;
        margin-top = 4;
        margin-bottom = 4;
        exclusive = true;
        passthrough = false;
        "gtk-layer-shell" = true;
        reload_style_on_change = true;

        # Modules placement
        modules-left = ["custom/spacer" "hyprland/workspaces" "custom/spacer"];
        modules-center = ["mpris"];
        modules-right = ["group/expand" "group/expand-3" "custom/spacer" "clock" "battery"];

        # Custom modules and settings

                "group/expand-3" = {
          orientation = "vertical";
          drawer = {
            "transition-duration" = 600;
            "children-class" = "not-power";
            "transition-to-left" = true;
            "click-to-reveal" = true;
          };
          modules = ["pulseaudio" "pulseaudio/slider"];
        };

        "pulseaudio" = {
          format = "{icon}";
          rotate = 0;
          format-muted = "󰝟";
          "tooltip-format" = "{icon} {desc} // {volume}%";
          "scroll-step" = 5;
          "format-icons" = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };

        "pulseaudio/slider" = {
          min = 5;
          max = 100;
          rotate = 0;
          device = "pulseaudio";
          "scroll-step" = 1;
          orientation = "vertical";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
          	default = "○";
	        active= "";
            # ⦿
          };
        };

  #       pulseaudio = {
  # format = "{volume}% {icon}";
  # format-bluetooth = "{volume}%  {icon}";
  # format-muted = " {icon}";
  # format-icons = {
  #   default = ["" "" ""];
  # };
#   on-click = "pamixer --toggle-mute";
#   on-scroll-up = "pamixer --increase 5";
#   on-scroll-down = "pamixer --decrease 5";
# };

        "battery" = {
          interval = 3; # adjust interval to reduce resource usage
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}";
          rotate = 0;
          format-charging = "<span color='#a6d189'>󱐋</span>";
          format-plugged = "󰂄";
          format-icons = [
            "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
          ];
          tooltip-format = "{capacity}%"; # Show battery percentage on hover
          on-click-right = "pkill waybar & hyprctl dispatch exec waybar";
        };

        "custom/smallspacer" = {
          format = " ";
          rotate = 0;
        };

        memory = {
          interval = 5; # adjust interval to reduce resource usage
          format = " {used}"; # simple format showing memory usage
          tooltip = false; # disable tooltip for minimal look
        };

        cpu = {
          interval = 5; # adjust interval for efficiency
          format = " {usage}%"; # Simple format showing CPU usage percentage
          tooltip = false; # Disable tooltip for minimal look
        };
        tray = {
          "icon-size" = 16;
          rotate = 0;
          spacing = 3;
        };

        "group/expand" = {
          orientation = "vertical";
          drawer = {
            "transition-duration" = 600;
            "children-class" = "not-power";
            "transition-to-left" = true;
          };
          modules = ["custom/menu" "custom/spacer" "tray"];
        };

        "custom/menu" = {
          format = "󰅃";
          rotate = 0;
        };

        clock = {
          format = "{:%H\n%M\n%S}";
          interval = 1;
          rotate = 0;
          "on-click" = "/usr/local/bin/ags -t ActivityCenter";
          "tooltip-format" = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
        };
      };
    };

    # Style for Waybar
    style = ''
* {
    font-family: "JetBrains Mono Nerd Font";
    font-weight: bold; 
    font-size: 15px;
    color: #ffffff;
}

#custom-notification {
  font-family: "JetBrains Mono Nerd Font";
  font-size: 18px;
  color: #cccedb;
  margin-left: -2px;
  margin-top: -4px;
  padding-bottom: 12px;
}

window#waybar {
    background: rgba(21, 21, 21, 0.83); 
    border: 3px solid rgba(255, 255, 255, 1); /* Updated to make the border fully white */
    border-radius: 6px;
}

tooltip {
    background: #1D2021;
    color: #FBF1C7;
    font-size: 13px;
    border-radius: 7px;
    border: 2px solid #101a24;
}

#workspaces {
    font-weight: normal;
    background: rgba(23, 23, 23, 0.0);
    color: #B1B2BD;
    box-shadow: none;
    text-shadow: none;
    border-radius: 3px;
    transition: 0.2s ease;
    padding-left: 6px;  /* Adjust for centering */
    padding-right: 6px;
    padding-top: 4px;
    padding-bottom: 4px;
}

#workspaces button {
    font-weight: normal;
    background: rgba(23, 23, 23, 0.0);
    color: #B1B2BD;
    box-shadow: none;
    text-shadow: none;
    border-radius: 9px;
    transition: 0.2s ease;
    padding-left: 2px; /* Increase padding for spacing */
    padding-right: 2px; /* Increase padding for spacing */
}

#workspaces button.active {
    color: #cccedb;
    font-weight: normal;
    transition: all 0.3s ease;
    padding-left: 2px;
    padding-right: 2px;
}

#workspaces button:hover {
    background: none;
    color: #7DAEA3;
    font-weight: normal;
    animation: ws_hover 20s ease-in-out 1;
    transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
}

#battery {
    font-weight: normal;
    font-size: 22px;
    color: #a6d189;
    background: rgba(23, 23, 23, 0.0);
    opacity: 1;
    margin: 5px 0px; /* Added margin to create space around the battery */
    padding-left: 10px;
    padding-right: 10px;
}

#pulseaudio {
    font-weight: normal;
    font-size: 24px; /* Increased the font size for the volume icon */
    color: #cccedb;
    background: rgba(22, 19, 32, 0.0);
    opacity: 1;
    margin-left: 0px;
}

#backlight-slider slider,
#pulseaudio-slider slider {
    background: #A1BDCE;
    background-color: transparent;
    box-shadow: none;
}

#backlight-slider trough,
#pulseaudio-slider trough {
    min-width: 9px;
    min-height: 90px;
    margin-bottom: 6px;
    border-radius: 8px;
    background: #343434;
    margin-left: -4px;
    margin-right: -4px;
}

#backlight-slider highlight,
#pulseaudio-slider highlight {
    border-radius: 8px;
    background-color: #2096C0;
}

    '';
  };
}

