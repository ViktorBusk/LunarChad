vim.o.termguicolors = true

local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1

g.nvim_tree_window_picker_exclude = {
   filetype = { 'notify', 'packer', 'qf' },
   buftype = {'terminal' },
}

lvim.builtin.nvimtree = {
  active = true,
  on_config_done = nil,
  setup = {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      enable = true,
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 200,
    },
    view = {
      allow_resize = true,
      side = "left",
      width = 25,
      hide_root_folder = true,
      mappings = {
        custom_only = false,
        list = {},
      },
    },
    filters = {
      dotfiles = false,
      --custom = { ".git", "node_modules", ".cache" },
    },
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
    tree_width = 25,
  },
  quit_on_open = 0,
  git_hl = 0,
  disable_window_picker = 0,
  root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
  icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
  },
}
