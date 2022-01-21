-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufEnter,BufWinEnter,FileType,WinEnter", "*", "lua require(\"custom.utils\").hide_statusline()" },
  { "BufEnter", "*", "lua require(\"custom.utils\").on_doxygen_highlight()" }, -- Clear doxygen syntax highlights
  { "BufEnter", "*", "lua require(\"colors.terminal\").on_active()" }, -- Use custom terminal themes
}
