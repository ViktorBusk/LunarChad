-- Source: https://github.com/NvChad/NvChad/blob/main/lua/core/utils.lua
local M = {}

M.on_init = function()
  M.set_theme()
  M.set_options()
end

M.set_theme = function()
  -- Check which theme option is set
  if lvim.custom.base16.enable then
    lvim.colorscheme = "default"
    require("colors").init()
  else
    lvim.colorscheme = lvim.custom.theme
  end
end

M.set_options = function()
  -- Apply user settings
  vim.opt.showtabline = lvim.custom.tab
  vim.opt.shiftwidth = lvim.custom.tab
  vim.opt.tabstop = lvim.custom.tab
end

M.hide_statusline = function()
  local hidden = lvim.custom.statusline.hidden
  local shown = lvim.custom.statusline.shown
  local api = vim.api
  local buftype = api.nvim_buf_get_option("%", "ft")

  -- shown table from config has the highest priority
  if vim.tbl_contains(shown, buftype) then
    api.nvim_set_option("laststatus", 2)
    return
  end

  if vim.tbl_contains(hidden, buftype) then
    api.nvim_set_option("laststatus", 0)
    return
  else
    api.nvim_set_option("laststatus", 2)
  end
end

M.close_buffer = function(bufexpr, force)
  -- This is a modification of a NeoVim plugin from
  -- Author: ojroques - Olivier Roques
  -- Src: https://github.com/ojroques/nvim-bufdel
  -- (Author has okayed copy-paste)

  -- ----------------
  -- Helper functions
  -- ----------------

  -- Switch to buffer 'buf' on each window from list 'windows'
  local function switch_buffer(windows, buf)
    local cur_win = vim.fn.winnr()
    for _, winid in ipairs(windows) do
      vim.cmd(string.format("%d wincmd w", vim.fn.win_id2win(winid)))
      vim.cmd(string.format("buffer %d", buf))
    end
    vim.cmd(string.format("%d wincmd w", cur_win)) -- return to original window
  end

  -- Select the first buffer with a number greater than given buffer
  local function get_next_buf(buf)
    local next = vim.fn.bufnr "#"
    if lvim.custom.bufferline.close.next == "alternate" and
        vim.fn.buflisted(next) == 1 then
      return next
    end
    for i = 0, vim.fn.bufnr "$" - 1 do
      next = (buf + i) % vim.fn.bufnr "$" + 1 -- will loop back to 1
      if vim.fn.buflisted(next) == 1 then
        return next
      end
    end
  end

  -- ----------------
  -- End helper functions
  -- ----------------

  local buf = vim.fn.bufnr()
  if vim.fn.buflisted(buf) == 0 then -- exit if buffer number is invalid
    vim.cmd "close"
    return
  end

  if #vim.fn.getbufinfo { buflisted = 1 } < 2 then
    if lvim.custom.bufferline.close.quit then
      -- exit when there is only one buffer left
      if force then
        vim.cmd "qall!"
      else
        vim.cmd "confirm qall"
      end
      return
    end

    local chad_term, type = pcall(function()
      return vim.api.nvim_buf_get_var(buf, "term_type")
    end)

    if chad_term then
      -- Must be a window type
      vim.cmd(string.format("setlocal nobl", buf))
      vim.cmd "enew"
      return
    end
    -- don't exit and create a new empty buffer
    vim.cmd "enew"
    vim.cmd "bp"
  end

  local next_buf = get_next_buf(buf)
  local windows = vim.fn.getbufinfo(buf)[1].windows

  -- force deletion of terminal buffers to avoid the prompt
  if force or vim.fn.getbufvar(buf, "&buftype") == "terminal" then
    local chad_term, type = pcall(function()
      return vim.api.nvim_buf_get_var(buf, "term_type")
    end)

    -- TODO this scope is error prone, make resilient
    if chad_term then
      if type == "wind" then
        -- hide from bufferline
        vim.cmd(string.format("%d bufdo setlocal nobl", buf))
        -- swtich to another buff
        -- TODO switch to next bufffer, this works too
        vim.cmd "BufferLineCycleNext"
      else
        local cur_win = vim.fn.winnr()
        -- we can close this window
        vim.cmd(string.format("%d wincmd c", cur_win))
        return
      end
    else
      switch_buffer(windows, next_buf)
      vim.cmd(string.format("bd! %d", buf))
    end
  else
    switch_buffer(windows, next_buf)
    vim.cmd(string.format("silent! confirm bd %d", buf))
  end
  -- revert buffer switches if user has canceled deletion
  if vim.fn.buflisted(buf) == 1 then
    switch_buffer(windows, buf)
  end
end
--
return M
