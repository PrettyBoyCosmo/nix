{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      image-nvim
    ];

    extraConfigLua = ''
  -- Image.nvim setup
  require("image").setup({
    backend = "kitty",
    kitty_method = "normal",

    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        filetypes = { "markdown", "vimwiki" },
      },
    },

    max_height_window_percentage = 40,
    editor_only_render_when_focused = true,
    tmux_show_only_in_active_window = true,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  })

  -- Autocmd to prepend ./01-assets/ only if not already present
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.md",
    callback = function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      for i, line in ipairs(lines) do
        lines[i] = line:gsub("!%[%[(.-)%]%]", function(match)
          if not match:find("^./01%-assets/") then
            return "![[./01-assets/" .. match .. "]]"
          else
            return "![[" .. match .. "]]"
          end
        end)
      end
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end,
  })
'';


  };
}

