--[[
  The goal of this project is to combine both -
  LunarVim and NvChad, getting the best parts from each.

  (https://www.lunarvim.org/#opinionated)
  "LunarVim ships with a sane default config for you to build on top of.
  Features include autocompletion, integrated terminal, -
  file explorer, fuzzy finder, LSP, linting, formatting and debugging."

  (https://nvchad.github.io/features)
  "NvChad comes with many comforts of a modern IDE.
  All lazy-loaded and built on top of NeoVim's fantastic -
  lua integration while still looking very beautiful!"

  LunarVim: https://github.com/LunarVim/LunarVim
  NvChad: https://github.com/NvChad/NvChad
--]]

-- Source config files
local ok, err = pcall(require, "custom")
if not ok then
  error(("Error loading core...\n\n%s"):format(err))
end
