-- Additional Plugins
lvim.plugins = {
  {
    "NvChad/nvim-base16.lua",
  },
  {
    "andymass/vim-matchup",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.blankline")
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("custom.plugins.configs.colorizer")
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("custom.plugins.configs.signature")
    end
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("custom.plugins.configs.bufferline")
    end
    },
  {
    "famiu/feline.nvim",
    config = function()
      require("custom.plugins.configs.statusline")
    end
  },
}
