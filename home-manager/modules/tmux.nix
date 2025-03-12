{ config, lib, pkgs, ... }:

let
  # Fetch TPM v3.1.0 with the correct hash
  tpm = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "v3.1.0";  # Latest stable release
    sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";  # Updated hash
  };
in
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "Space"; # tmux prefix key
    terminal = "screen-256color";
    extraConfig = ''
      # Refresh binding
      unbind r
      bind r source-file ~/.tmux.conf

      # Navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key -n C-M-h resize-pane -L 3
      bind-key -n C-M-j resize-pane -D 3
      bind-key -n C-M-k resize-pane -U 3
      bind-key -n C-M-l resize-pane -R 3

      # Keep current working directory across panes
      bind c new-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      # Options
      set -g mouse on
      setw -g mode-keys vi
      set-option -g status-position top
      set-option -g allow-passthrough on
      set-option -g default-shell /home/bluecosmo/.nix-profile/bin/bash
      set -g pane-active-border-style fg=#FFFFFF

      # Copy mode (vim keybinds)
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip"
      bind P paste-buffer
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip"

      # TPM Plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'niksingh710/minimal-tmux-status'

      # Minimal tmux status theme
      set -g @minimal-tmux-bg "#ccffff"
      set -g status-left-length 15
      set -g @minimal-tmux-indicator-str "$USER"
      set -g @minimal-tmux-status "bottom"
      set -g @minimal-tmux-justify "centre"
      bind-key b set-option status

      # Run TPM
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

  # Ensure TPM is installed properly
  home.file.".tmux/plugins/tpm".source = tpm;
}

