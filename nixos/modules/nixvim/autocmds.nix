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

      # custom syntax highlights
      {
        event = "BufReadPost";
        pattern = "*";
        command = "syntax clear cTodo | syntax match CustomTODO /\\<TODO:/ containedin=cCommentL | highlight CustomTODO guifg=#ff9900 gui=italic";
      }
      {
        event = "BufReadPost";
        pattern = "*";
        command = "syntax match CustomNOTE /\\<NOTE:/ containedin=cCommentL | highlight CustomNOTE guifg=#ff9900 gui=italic";
      }

    ];
  };
}

