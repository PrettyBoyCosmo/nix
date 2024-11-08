{
  programs.nixvim = {
    autoCmd = [
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
        event = "Syntax";
        pattern = "*";
        command = "highlight CustomTODO guifg=#ff8800 gui=bold";
      }
      {
        event = "Syntax";
        pattern = "*";
        command = "highlight CustomNOTE guifg=#00ff88 gui=italic";
      }
      {
        event = "BufReadPost";
        pattern = "*";
        command = "syntax match CustomTODO /\\<TODO:/";
      }
      {
        event = "BufReadPost";
        pattern = "*";
        command = "syntax match CustomNOTE /\\<NOTE:/";
      }
    ];
  };
}

