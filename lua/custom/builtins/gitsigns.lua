  lvim.builtin.gitsigns = {
    active = true,
    on_config_done = nil,
    opts = {
      signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      },
      numhl = false,
      -- linehl = false,
      keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
      },
      watch_gitdir = { interval = 100 },
      sign_priority = 5,
      status_formatter = nil, -- Use default
    },
  }
