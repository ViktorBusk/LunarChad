-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- Telescope find projects
lvim.keys.normal_mode["<C-p>"] = ":Telescope find_files<CR>"
-- SHIFT-q will close current buffer
lvim.keys.normal_mode["<S-q>"] = ":bd<CR>"
-- Centers search result
lvim.keys.normal_mode["n"] = "nzz"
-- Remap C-c to <for i in rnageesc>
lvim.keys.normal_mode["<C-c>"] = "<esc>"
-- unmap a default keymapping

-- Unmap toggleterm and use basic instead
-- lvim.keys.normal_mode["<C-t>"] = ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert<CR>"

-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["m"] = { "<cmd>MarkdownPreview<CR>", "Markdown Preview" }

-- Easymotion, Type 2 characters
lvim.builtin.which_key.mappings["a"] = { "<Plug>(easymotion-overwin-f2)", "EasyMotion" }

lvim.builtin.which_key.mappings["t"] = { "<cmd>TodoTelescope<CR>", "Todos" }

lvim.builtin.which_key.mappings["s"]["b"] = {
  "<cmd>Telescope marks<CR>", "Bookmarks"
}
lvim.builtin.which_key.mappings["_"] = {
  "<cmd>e ~/.config/lvim/config.lua<CR>", "Edit Config"
}

lvim.builtin.which_key.mappings["d"] = {
  name = "+Dashboard",
  ["f"] = { "<cmd>DashboardNewFile<CR>", "New File" }
}

lvim.builtin.which_key.mappings["S"] = {
  name = "+Session",
  ["l"] = { "<cmd>SessionLoad<CR>", "Load Last Session" },
  ["s"] = { "<cmd>SessionSave<CR>", "Save Current Session" }
}

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<CR>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<CR>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<CR>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<CR>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<CR>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<CR>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.terminal.open_mapping = [[]] -- Remove toggleterm, feels sluggish and not responsive

-- Buffers
lvim.builtin.which_key.mappings["c"] = { ":lua require(\"custom.utils\").close_buffer()<CR>", "Close Buffer" }

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<A-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineMovePrev<CR>"

lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.which_key.mappings["b"] = {
  name = "Buffers",
  j = { "<cmd>BufferLinePick<CR>", "Jump" },
  f = { "<cmd>Telescope buffers<CR>", "Find" },
  b = { "<cmd>b#<CR>", "Previous" },
  h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
  l = { "<cmd>BufferLineCloseRight<CR>", "Close all to the right" },
  s = {
    name = "Sort",
    e = { "<cmd>BufferLineSortByExtension<CR>", "Sort By Extension" },
    d = { "<cmd>BufferLineSortByDirectory<CR>", "Sort By Directory" },
    t = { "<cmd>BufferLineSortByTabs<CR>", "Sort By Tabs" }
  }
}
