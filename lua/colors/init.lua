-- Source: https://github.com/NvChad/NvChad/blob/main/lua/colors/init.lua
local M = {}

-- load given theme if given, otherwise nvchad_theme
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
      theme = lvim.custom.base16.theme
    else
      theme = lvim.custom.theme
    end
  end

  -- Try loading a custom palette with the same name
  if not pcall(require,  "colors.palettes." .. theme) then
      module = "hl_themes" -- Use base16 shell colors
  else
      module = "colors.palettes" -- Use custom shell colors
  end

  local present, theme_colors = pcall(require, module .. "." .. theme)
  -- Use fallback theme if no palette was found
  if not present then
    theme_colors = require("colors.palettes.default")
  end

  return theme_colors
end

return M
