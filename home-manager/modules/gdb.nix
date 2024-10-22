{
  programs.gdb = {
    enable = true;
    extraConfig = ''
      set exec-wrapper /run/current-system/sw/bin/bash
    '';
  };
}
