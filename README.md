<h1 align="center">LunarChad</h1>

<div align="center"><p>

  <a href="https://github.com/ViktorBusk/LunarChad/blob/master/LICENSE"
    ><img
        src="https://img.shields.io/github/license/viktorbusk/LunarChad?style=flat-square&logo=GNU&label=License"
        alt="License"
      />
  </a>
  <a href="https://neovim.io/"
    ><img
        src="https://img.shields.io/badge/Neovim-0.5+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white"
        alt="Neovim Minimum Version"
      />
  </a>

  <a href="https://www.lua.org/"
    ><img
        src="https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua"
        alt="Made with Lua"
      />
  </a>
</p>

</div>

>The goal of this project is to combine both
[LunarVim](https://github.com/LunarVim/LunarVim) and [NvChad](https://github.com/NvChad/NvChad), getting the best parts from each.

* [LunarVim](https://github.com/LunarVim/LunarVim) has a great default configuration, with LSP + project support, right out of the box.

* [NvChad](https://github.com/NvChad/NvChad) looks stunning and comes with a variety of built in themes to choose from.

**LunarChad** is a [LunarVim](https://github.com/LunarVim/LunarVim) configuration stylized to look like [NvChad](https://github.com/NvChad/NvChad)
(with a personal touch 😄)

## Showcase

##### [NvChad theme: onedark](https://github.com/NvChad/nvim-base16.lua/blob/master/lua/hl_themes/onedark.lua)

<img src=".utils/images/lsp.png?raw=true"></img>

##### [NvChad theme: doom-chad](https://github.com/NvChad/nvim-base16.lua/blob/master/lua/hl_themes/doom-chad.lua)

<img src=".utils/images/preview.png?raw=true"></img>

##### [LunarVim theme: onedarker](https://github.com/LunarVim/onedarker.nvim)

<img src=".utils/images/lsp_install.png?raw=true"></img>

## Installation
**LunarChad** is a configured version of [LunarVim](https://github.com/LunarVim/LunarVim#install-in-one-command). For more information please read the LunarVim documentation at [lunarvim.org](https://www.lunarvim.org/). Make sure you have the release version of Neovim (0.5).
```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

```
If you already have a lvim config you might want to back it up first.
```sh
mv ~/.config/lvim/ ~/.config/lvim.old/
```
Clone **LunarChad** to your lvim configuration folder located at `~/.config/lvim/`.

```sh
git clone https://github.com/ViktorBusk/LunarChad.git ~/.config/lvim/
```
Start LunarVim by entering `lvim` inside a terminal. Install the required plugins with the command `:PackerSync`.

## Configuration

To configure **LunarChad** simply change the contents of `~/.config/lvim/config.lua`. By default, this file is used to source necessary **LunarChad** modules. Configurations are for the most part just tweaks to LunarVims built in customization layer: `lvim`. **LunarChad** then provides additional settings through the nested table: `lvim.custom`. It mainly consists of data regarding appearance (colorscheme, bufferline, statusline etc.) and is defined in `~/.config/lvim/lua/custom/options.lua`.

Example Config (default): 

```lua
-- ~/.config/lvim/lua/custom/options.lua
lvim.custom = {
  tab = 2, -- tabline, swhiftwidth, tabstop
  theme = "onedarker",
  base16 = {
    -- Overrides the current theme (lvim.custom.theme)
    enable = true, -- If set to "false", "lvim.custom.theme" will be used instead.
    italic_comments = true,
    bold_highlight = false,
    cursor_line = false,
    theme = "onedark" -- https://github.com/NvChad/nvim-base16.lua/tree/master/lua/hl_themes
  },
  statusline = {
    diagnostics = { enable = true },
    lsp_progress = { enable = true },
    hidden = { "help", "dashboard", "NvimTree", "terminal" },
    shortline = true, -- Show short statusline on small screens
    shown = {},
    style = "default" -- default, round , slant , block , arrow
  },
  bufferline = {
    close = {
      next = "cycle", -- How to retrieve the next buffer
      quit = true -- Exit when last buffer is deleted
    },
  }
}

-- General
lvim.log.level = "warn"

-- Termnial
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 20
lvim.builtin.terminal.shade_terminals = true

-- Change the timeoutlen for whichkey to show
vim.opt.timeoutlen = 400

-- Show/hide eye candy
vim.opt.showmode = true
vim.opt.ruler = false
vim.opt.cmdheight = 1
```
### Essential Files
* General Options: `~/.config/lvim/lua/custom/options.lua`
* LSP: `~/.config/lvim/lua/custom/lsp.lua`
* Keybindings: `~/.config/lvim/lua/custom/keymappings.lua`
* Highlights: `~/.config/lvim/lua/colors/highlights.lua`

Please feel free to edit or make any changes you deem necessary. For more information visit [lunarvim.org](https://www.lunarvim.org/) or [nvchad.github.io](https://nvchad.github.io/).

## Author

**Viktor Busk**

* Github: [@ViktorBusk](https://github.com/ViktorBusk)

## Acknowledgments

* LunarVim: https://github.com/LunarVim/LunarVim
* NvChad: https://github.com/NvChad/NvChad

## License
This project is licensed under the GNU General Public License v3.0.
<p>
    <a href="https://github.com/ViktorBusk/LunarChad/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/viktorbusk/LunarChad?style=flat-square&logo=GNU&label=License" alt="License"
    />
</p>
