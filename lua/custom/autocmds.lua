-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufEnter,BufWinEnter,FileType,WinEnter", "*", "lua require(\"custom.utils\").hide_statusline()" },
  { "BufEnter,BufWinEnter,FileType,WinEnter", "*", "lua require(\"colorizer\").attach_to_buffer(0)" },
}
