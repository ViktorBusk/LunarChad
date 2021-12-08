-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufEnter,BufWinEnter,FileType,WinEnter", "*", "lua require(\"custom.utils\").hide_statusline()" },
  { "BufEnter", "*", "syntax clear" }, -- Clear doxygen syntax highlights
}
