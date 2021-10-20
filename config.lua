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

  LunarVim ships jam packed, mainly with LSP and project support, right out of the box.

  NvChad looks absolutely stunning, with a variety of built in themes to choose from.

  Consequently, LunarChad is built on top of LunarVim and stylized to look like NvChad, -
  with a personal touch of course ;^)

  LunarVim: https://github.com/LunarVim/LunarVim
  NvChad: https://github.com/NvChad/NvChad
--]]

-- Source config files
require("custom.keymappings")
require("custom.options")
require("custom.utils").set_theme()
require("custom.neovide")
require("custom.builtins")
require("custom.lsp")
require("custom.plugins")
require("custom.autocmds")
