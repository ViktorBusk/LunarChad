-- Custom lvim config
lvim.custom = {
  tab = 2, -- tabline, swhiftwidth, tabstop
  theme = "onedarker",
  base16 = {
    -- Overrides the current theme (lvim.custom.theme)
    enable = true, -- If set to "false", "lvim.custom.theme" will be used instead.
    italic_comments = true,
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
    }
  }
}

-- General
lvim.log.level = "warn"
lvim.format_on_save = true

-- Termnial
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 20
lvim.builtin.terminal.shade_terminals = true

-- Tab settings
vim.opt.showtabline = lvim.custom.tab
vim.opt.shiftwidth = lvim.custom.tab
vim.opt.tabstop = lvim.custom.tab

-- Change the timeoutlen for whichkey to show
vim.opt.timeoutlen = 400

-- Show/hide eye candy
vim.opt.showmode = true
vim.opt.ruler = false
vim.opt.cmdheight = 1
