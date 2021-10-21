-- Source: https://github.com/NvChad/NvChad/blob/main/lua/colors/init.lua
local M = {}

-- if theme given, load given theme if given, otherwise nvchad_theme
M.init = function(theme)
  if not theme then
    theme = lvim.custom.base16.theme
  end

  local present, base16 = pcall(require, "base16")

  if present then
    -- first load the base16 theme
    base16(base16.themes(theme), true)

    -- unload to force reload
    package.loaded["colors.highlights" or false] = nil
    -- then load the highlights
    require "colors.highlights"
  else
    return false
  end
end

-- returns a table of colors for given or current theme
M.get = function(theme)
  local module = ""

  if not theme then
    if lvim.custom.base16.enable then
      module = "hl_themes" -- Base16 theme
      theme = lvim.custom.base16.theme
    else
      module = "colors.palettes" -- Custom themek
      theme = lvim.custom.theme
    end
  end

  local present, theme_colors = pcall(require, module .. "." .. theme)
  if not present then
    theme_colors = require("colors.palettes.default")
  end

  return theme_colors
end

return M
