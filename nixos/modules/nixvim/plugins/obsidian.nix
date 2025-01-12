{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "notes_subdir"; # or "current_dir" if you want new notes created in the current directory
      workspaces = [
        {
          name = "vault";
          path = "~/obsidian";
        }
      ];
      templates = {
        date_format = "%Y-%m-%d";
        subdir = "04-templates";
      };
      attachments = {
        img_folder = "01-assets";
      };
      disable_frontmatter = true;
    };
  };
}

