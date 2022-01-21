local M = {}

local colors = require("colors").get()

M.on_active = function()
  if lvim.custom.terminal.colors.custom_profile.enable then
    -- Black and Dark Gray
    vim.cmd("let g:terminal_color_0  = '" .. colors.black .. "'")
    vim.cmd("let g:terminal_color_8  = '" .. colors.one_bg .. "'")
    -- Red
    vim.cmd("let g:terminal_color_1  = '" .. colors.red .. "'")
    vim.cmd("let g:terminal_color_9  = '" .. colors.red .. "'")
    -- Green
    vim.cmd("let g:terminal_color_2  = '" .. colors.green .. "'")
    vim.cmd("let g:terminal_color_10  = '" .. colors.green .. "'")
    -- Yellow
    vim.cmd("let g:terminal_color_3  = '" .. colors.yellow .. "'")
    vim.cmd("let g:terminal_color_11  = '" .. colors.yellow .. "'")
    -- Blue
    vim.cmd("let g:terminal_color_4  = '" .. colors.blue .. "'")
    vim.cmd("let g:terminal_color_12  = '" .. colors.blue .. "'")
    -- Magneta
    vim.cmd("let g:terminal_color_5  = '" .. colors.baby_pink .. "'")
    vim.cmd("let g:terminal_color_13  = '" .. colors.baby_pink .. "'")
    -- Aqua
    vim.cmd("let g:terminal_color_6  = '" .. colors.cyan .. "'")
    vim.cmd("let g:terminal_color_14  = '" .. colors.cyan .. "'")
    -- White and Light Gray
    vim.cmd("let g:terminal_color_7  = '" .. colors.white .. "'")
    vim.cmd("let g:terminal_color_15  = '" .. colors.grey .. "'")
  end
end
return M
