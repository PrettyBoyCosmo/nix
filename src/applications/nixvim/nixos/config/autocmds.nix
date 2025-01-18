{
  programs.nixvim = {
    autoCmd = [
      # program templates
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.c" ];
        command = "0r ~/development/templates/template.c";
      }
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.cpp" ];
        command = "0r ~/development/templates/template.cpp";
      }
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.py" ];
        command = "0r ~/development/templates/template.py";
      }
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.s" ];
        command = "0r ~/development/templates/template.s";
      }
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.asm" ];
        command = "0r ~/development/templates/template.asm";
      }
      {
        event = [ "BufNewFile" ];
        pattern = [ "*.h" ];
        command = "0r ~/development/templates/template.h";
      }
      {
        event = "VimEnter";
        pattern = "*";
        command = ''
          highlight NotifyERRORBorder guibg=#0f1c21 guifg=#0f1c21
          highlight NotifyWARNBorder guibg=#0f1c21 guifg=#0f1c21
          highlight NotifyINFOBorder guibg=#0f1c21 guifg=#0f1c21
          highlight NotifyDEBUGBorder guibg=#0f1c21 guifg=#0f1c21
          highlight NotifyTRACEBorder guibg=#0f1c21 guifg=#0f1c21
          highlight HarpoonWindow guibg=#0f1c21 guifg=#ffffff
          highlight HarpoonBorder guibg=#0f1c21 guifg=#ffffff
          highlight HarpoonMenu guibg=#0f1c21 guifg=#ffffff
          highlight Normal guibg=#0f1c21 guifg=#ffffff
          highlight NormalFloat guibg=#0f1c21 guifg=#ffffff
          highlight FloatBorder guibg=#0f1c21 guifg=#ffffff
          highlight TelescopeNormal guibg=#0f1c21
          highlight TelescopeBorder guibg=#0f1c21 guifg=#ffffff
          highlight TelescopePromptNormal guibg=#0f1c21
          highlight TelescopePromptBorder guibg=#0f1c21 guifg=#ffffff
          highlight TelescopePreviewNormal guibg=#0f1c21
          highlight TelescopePreviewBorder guibg=#0f1c21 guifg=#ffffff
          highlight TelescopeResultsNormal guibg=#0f1c21
          highlight TelescopeResultsBorder guibg=#0f1c21 guifg=#ffffff
          highlight NotifyBackground guibg=#0f1c21 guifg=#0f1c21
          highlight NotifyERRORBody guibg=#0f1c21 guifg=#BF616A
          highlight NotifyWARNBody guibg=#0f1c21 guifg=#EBCB8B
          highlight NotifyINFOBody guibg=#0f1c21 guifg=#88C0D0
          highlight NotifyDEBUGBody guibg=#0f1c21 guifg=#81A1C1
          highlight NotifyTRACEBody guibg=#0f1c21 guifg=#B48EAD
          highlight FloatTermNormal guibg=#0f1c21 guifg=#ffffff
          highlight FloatTermBorder guibg=#0f1c21 guifg=#ffffff
          highlight Floaterm guibg=#0f1c21
        '';
      }
    ];
  };
}
