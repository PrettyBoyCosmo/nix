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
    ];
  };
}

