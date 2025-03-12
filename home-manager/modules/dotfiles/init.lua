-- Title:       init.lua
-- Description: NeoVim Config File
-- Author:      bluecosmo

--------------------------------------------------------------------------------
-- 0. Metadata / Basic Setup
--------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Create a shortcut for keymaps
local keymap = vim.keymap.set
local opts = { silent = true }

--------------------------------------------------------------------------------
-- 1. Lazy Bootstrap
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
-- 2. Plugin Definitions
--------------------------------------------------------------------------------
local plugins = {
  -- Airline
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- Markdown / Note Tools
  { "dkarter/bullets.vim" },
  { "dhruvasagar/vim-table-mode" },

  -- Floaterm
  { "voldikss/vim-floaterm" },

  -- Harpoon
  { "ThePrimeagen/harpoon" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }},

  -- Transparent.nvim
  { "xiyaowong/transparent.nvim" },

  -- image.nvim
  { "3rd/image.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-refactor" },

  -- LSP & related
  { "neovim/nvim-lspconfig" },

  -- mini.nvim
  { "echasnovski/mini.nvim" },

  -- nvim-notify
  { "rcarriga/nvim-notify" },

  -- Obsidian
  { "epwalsh/obsidian.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- lsp-zero
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip" }
    }
  },

  -- tmux navigation
  { "christoomey/vim-tmux-navigator" },

  -- todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
      },
    }
  },

  -- alpha-nvim (dashboard)
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[  ██████╗ ██████╗ ███████╗███╗   ███╗ ██████╗ ██████╗ ██╗██╗   ██╗███╗   ███╗ ██████╗███████╗ ]],
        [[ ██╔════╝██╔═══██╗██╔════╝████╗ ████║██╔═══██╗██╔══██╗██║██║   ██║████╗ ████║██╔════╝██╔════╝ ]],
        [[ ██║     ██║   ██║███████╗██╔████╔██║██║   ██║██║  ██║██║██║   ██║██╔████╔██║██║     ███████╗ ]],
        [[ ██║     ██║   ██║╚════██║██║╚██╔╝██║██║   ██║██║  ██║██║██║   ██║██║╚██╔╝██║██║     ╚════██║ ]],
        [[ ╚██████╗╚██████╔╝███████║██║ ╚═╝ ██║╚██████╔╝██████╔╝██║╚██████╔╝██║ ╚═╝ ██║╚██████╗███████║ ]],
        [[  ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝╚══════╝ ]],
        [[]],
        [[             • Malware Development • Offensive Development • Payload Development •            ]]
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", " • New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("o", " • Open File", ":Telescope find_files <CR>"),
        dashboard.button("r", " • Recently Used", ":Telescope oldfiles <CR>"),
        dashboard.button("f", " • Find Text", ":Telescope live_grep <CR>"),
        dashboard.button("e", " • Edit Config", ":e ~/.dotfiles/.config/nvim/init.lua<CR>"),
        dashboard.button("q", " • Quit NeoVim", ":qa<CR>")
      }

      local function footer()
        return " NeoVim"
      end

      dashboard.section.footer.val = footer()
      alpha.setup(dashboard.config)
    end
  }
}

local p_opts = {}
require("lazy").setup(plugins, p_opts)

--------------------------------------------------------------------------------
-- 3. Plugin Configuration
--------------------------------------------------------------------------------

-- 3.1 Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "python",
    "json",
    "lua",
    "make",
    "markdown",
    "nix",
    "regex",
    "toml",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "html",
    "java",
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  folding = { enable = true },
  refactor = {
    highlight_definitions = { enable = true, clear_on_cursor_move = false },
  },
})

-- 3.2 Telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "^.git/",
      "^.env/",
      "^.mypy_cache/",
      "^__pycache__/",
      "^output/",
      "^data/",
      "%.ipynb",
    },
    set_env = { COLORTERM = "truecolor" },
    mappings = {
      i = {
        ["<C-o>"] = actions.select_default,
        ["<C-f>"] = actions.select_default,
      },
    },
  },
})

 -- Transparent
require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {},
  exclude_groups = {},
  on_clear = function() end,
})

-- 3.3 Obsidian
require("obsidian").setup({
  workspaces = {
    {
      name = "vault",
      path = "~/obsidian",
    },
    {
      name = "wargames",
      path = "~/operations/wargames",
    },
  },

  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  new_notes_location = "notes_subdir",
  templates = {
    subdir = "~/templates",
    date_format = "%Y-%m-%d",
  },
  attachments = {
    img_folder = "01-assets",
  },
  disable_frontmatter = true,
})

-- 3.4 mini.nvim
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.trailspace").setup()
require("mini.surround").setup()

-- 3.5 Notify
require("notify").setup({
  timeout = 5000,
  stages = "fade_in_slide_out",
  background_colour = "#000000",
  render = "compact",
})

-- 3.6 LSP config / lsp-zero
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4)
  })
})
lsp_zero.on_attach(function(client, bufnr)
  local opts_lsp = { buffer = bufnr, remap = false }
  keymap("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts_lsp)
  keymap("n", "K", function() vim.lsp.buf.hover() end, opts_lsp)
  keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts_lsp)
  keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts_lsp)
  keymap("n", "[d", function() vim.diagnostic.goto_next() end, opts_lsp)
  keymap("n", "]d", function() vim.diagnostic.goto_prev() end, opts_lsp)
  keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts_lsp)
  keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts_lsp)
  keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts_lsp)
  keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts_lsp)
end)
vim.g.lsp_zero_api_warnings = 0
lsp_zero.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I"
  }
})
lsp_zero.setup()
require("lspconfig").clangd.setup({
  cmd = { "/run/current-system/sw/bin/clangd" }, -- Use system-installed clangd
})
require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    lsp_zero.default_setup
  }
})

-- 3.7 image.nvim
require("image").setup({
  backend = "kitty",
  processor = "magick_rock",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = true,
      floating_windows = false,
      filetypes = { "markdown", "vimwiki" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = { enabled = false },
    css = { enabled = false },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = false,
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false,
  tmux_show_only_in_active_window = false,
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
})

-- 3.8 Airline settings
vim.g["airline#extensions#tabline#enabled"] = 0
vim.g.airline_powerline_fonts = true
vim.g.airline_skip_empty_sections = true
vim.g.airline_theme = "transparent"

-- 3.9 Floaterm settings
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_shell = "/home/bluecosmo/.nix-profile/bin/bash"
vim.g.floaterm_title = ""

-- 3.10 Colorscheme
vim.cmd("colorscheme habamax")

--------------------------------------------------------------------------------
-- 4. Autocommands
--------------------------------------------------------------------------------

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  command = ":%s/\\s\\+$//e",
})

-- Insert file templates for new files
local templates = {
  c = "~/templates/template.c",
  cpp = "~/templates/template.cpp",
  py = "~/templates/template.py",
  s = "~/templates/template.s",
  asm = "~/templates/template.asm",
  h = "~/templates/template.h",
  java = "~/templates/Template.java",
}
for ext, path in pairs(templates) do
  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*." .. ext,
    command = "0r " .. path,
  })
end

-- Fix Obsidian image links on read
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

-- Highlight adjustments on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    local highlights = {
      { "NotifyERRORBorder", "#0f1c21", "#0f1c21" },
      { "NotifyWARNBorder", "#0f1c21", "#0f1c21" },
      { "NotifyINFOBorder", "#0f1c21", "#0f1c21" },
      { "NotifyDEBUGBorder", "#0f1c21", "#0f1c21" },
      { "NotifyTRACEBorder", "#0f1c21", "#0f1c21" },
      { "HarpoonWindow", "#0f1c21", "#ffffff" },
      { "HarpoonBorder", "#0f1c21", "#ffffff" },
      { "HarpoonMenu", "#0f1c21", "#ffffff" },
      { "Normal", "#0f1c21", "#ffffff" },
      { "NormalFloat", "#0f1c21", "#ffffff" },
      { "FloatBorder", "#0f1c21", "#ffffff" },
      { "TelescopeNormal", "#0f1c21", nil },
      { "TelescopeBorder", "#0f1c21", "#ffffff" },
      { "TelescopePromptNormal", "#0f1c21", nil },
      { "TelescopePromptBorder", "#0f1c21", "#ffffff" },
      { "TelescopePreviewNormal", "#0f1c21", nil },
      { "TelescopePreviewBorder", "#0f1c21", "#ffffff" },
      { "TelescopeResultsNormal", "#0f1c21", nil },
      { "TelescopeResultsBorder", "#0f1c21", "#ffffff" },
      { "NotifyBackground", "#0f1c21", "#0f1c21" },
      { "NotifyERRORBody", "#0f1c21", "#BF616A" },
      { "NotifyWARNBody", "#0f1c21", "#EBCB8B" },
      { "NotifyINFOBody", "#0f1c21", "#88C0D0" },
      { "NotifyDEBUGBody", "#0f1c21", "#81A1C1" },
      { "NotifyTRACEBody", "#0f1c21", "#B48EAD" },
      { "FloatTermNormal", "#0f1c21", "#ffffff" },
      { "FloatTermBorder", "#0f1c21", "#ffffff" },
      { "Floaterm", "#0f1c21", nil },
    }
    for _, hl in ipairs(highlights) do
      local name, bg, fg = hl[1], hl[2], hl[3]
      if fg then
        vim.cmd(string.format("highlight %s guibg=%s guifg=%s", name, bg, fg))
      else
        vim.cmd(string.format("highlight %s guibg=%s", name, bg))
      end
    end
  end,
})

--------------------------------------------------------------------------------
-- 5. Keymaps
--------------------------------------------------------------------------------

-- Harpoon keymaps
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>a", mark.add_file, opts)
keymap("n", "<leader>m", ui.toggle_quick_menu, opts)
for i = 1, 9 do
  keymap("n", "<leader>" .. i, function() ui.nav_file(i) end, opts)
end

keymap("n", "<C-S-P>", function() harpoon:list():prev() end, opts)
keymap("n", "<C-S-N>", function() harpoon:list():next() end, opts)
keymap("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { silent = true, desc = "Open harpoon window" })

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<C-o>", builtin.find_files, { silent = true, desc = "Find Files" })
keymap("n", "<C-f>", builtin.live_grep, { silent = true, desc = "Live Grep" })
keymap("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true, desc = "Find TODOs" })

-- Obsidian
keymap("n", "<A-i>", ":ObsidianTemplate<CR>", opts)
keymap("n", "<leader>op", ":ObsidianPasteImg<CR>", opts)

-- Floaterm
keymap("n", "<C-b>", ":FloatermToggle<CR>", opts)
keymap("t", "<C-b>", "<C-\\><C-n>:FloatermToggle<CR>", opts)

-- Table Mode
keymap("n", "<leader>tm", ":TableModeToggle<CR>", { silent = true, desc = "Toggle Table Mode" })
keymap("n", "<leader>tb", ":put =repeat('\\|---', v:count1) . '\\|'<CR>", opts)

-- Misc
keymap("n", "<leader>q", ":Alpha<CR>", opts)
keymap("n", "<leader>l", ":Mason<CR>", opts)
keymap("n", "<leader>r", ":edit<CR>", opts)
keymap("n", "<leader>b", "<C-^>", opts)

-- Searching / editing
keymap("n", "<esc>", ":noh<CR>", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<CR>", ":normal! zz<CR>", opts)
keymap("n", "gg", "ggzz", opts)
keymap("n", "GG", "GGzz", opts)

-- Quick fix
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Terminal / buffer
keymap("n", "<C-c>", ":b#<CR>", opts)
keymap("n", "<C-x>", ":close<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move lines in normal mode
keymap("n", "<M-k>", ":move-2<CR>", opts)
keymap("n", "<M-j>", ":move+<CR>", opts)

-- Tmux
vim.g.tmux_navigator_no_mappings = 1
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true, desc = "Tmux Navigate Left" })
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true, desc = "Tmux Navigate Down" })
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true, desc = "Tmux Navigate Up" })
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true, desc = "Tmux Navigate Right" })

-- Visual mode
keymap("v", "<Esc>", ":normal! zz<CR>", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<leader>ot", ":!column -t -s '|' -o '|'<CR>", opts)
keymap("v", "<leader>*", ":<C-u>'<,'>s/^/- /<CR>", opts)
keymap("v", "<leader>&", ":<C-u>'<,'>s/^/\\=printf('%d. ', line('.') - line(\"'<\") + 1)/<CR>", opts)

-- Insert mode
keymap("i", "<C-c>", "<Esc>", opts)
keymap("i", "<Esc>", "<Esc>:normal! zz<CR>", opts)

--------------------------------------------------------------------------------
-- 6. Options
--------------------------------------------------------------------------------
vim.opt.updatetime = 100
vim.opt.shell = "/home/bluecosmo/.nix-profile/bin/bash"

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Keep closed buffers open
vim.opt.hidden = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.conceallevel = 1

-- Swap and undo
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.backup = false

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling and cursor
vim.opt.scrolloff = 8
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Status line
vim.opt.laststatus = 3

-- Encoding
vim.opt.fileencoding = "utf-8"

-- True color
vim.opt.termguicolors = true

-- Spelling and wrapping
vim.opt.spell = true
vim.opt.wrap = true
vim.opt.linebreak = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Text formatting
vim.opt.textwidth = 0

-- Folding
vim.opt.foldlevel = 99

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
