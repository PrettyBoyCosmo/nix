{
  programs.bash = {
    enable = true;

    # Set custom shell aliases
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix";
      hms = "home-manager switch --flake ~/nix";
      v = "nvim";
      xs = "nix-shell ~/nix/shells/xonsh.nix --run 'xonsh'";
    };
    #     initExtra = ''
    #   # Check if we are in an interactive shell and not a subshell
    #   if [ -n "$PS1" ] && [ -z "$XONSH_RUNNING" ]; then
    #     export XONSH_RUNNING=1
    #     # Run nix-shell and make sure to reload the .xonshrc on each new session
    #     exec nix-shell ~/nix/shells/xonsh.nix --run "xonsh"
    #   fi
    # '';
  };
}

