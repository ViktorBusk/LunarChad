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
    open_on_setup = false,
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
   filters = {
      dotfiles = false,
   },
    view = {
      width = 25,
      side = "left",
      auto_resize = true,
      mappings = {
        custom_only = false,
      },
    },
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
    tree_width = 25,
  },
  -- ignore = { ".git", "node_modules", ".cache" },
  quit_on_open = 0,
  gitignore = 1,
  hide_dotfiles = 0,
  git_hl = 0,
  root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
  allow_resize = 1,
  auto_ignore_ft = { "startify", "dashboard" },
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
