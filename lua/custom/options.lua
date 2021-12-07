-- Custom lvim config
lvim.custom = {
  tab = 2, -- tabline, swhiftwidth, tabstop
  theme = "onedarker",
  -- TODO: Add option to use default NvChad mappings
  -- Maybe add option to provide a "chadrc" and/or "init" from an existing NvChad config
  NvChad ={
    mappings = true, -- If true, Set default keybindings to NvChad defaults, else use LunarVim defaults
  },
  base16 = {
    -- Overrides the current theme (lvim.custom.theme)
    enable = true, -- If set to "false", "lvim.custom.theme" will be used instead.
    italic_comments = false,
    document_highlight = {
      enable = false,
      bold_highlight = false,
    },
    cursor_line = false,
    theme = "onedark" -- https://github.com/NvChad/nvim-base16.lua/tree/master/lua/hl_themes
  },
  statusline = {
    diagnostics = { enable = true },
    lsp_progress = { enable = true },
    hidden = { "help", "dashboard", "NvimTree", "terminal" },
    shortline = true, -- Show short statusline on small screens
    shown = {},
    style = "default" -- default, round , slant , block , arrow
  },
  bufferline = {
    close = {
      next = "cycle", -- How to retrieve the next buffer
      quit = true -- Exit when last buffer is deleted
    },
  }
}

-- General
lvim.log.level = "warn"

-- Termnial
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.terminal.shade_terminals = true

-- Change the timeoutlen for whichkey to show
vim.opt.timeoutlen = 400

-- Show/hide eye candy
vim.opt.showmode = true
vim.opt.ruler = false
vim.opt.cmdheight = 1
