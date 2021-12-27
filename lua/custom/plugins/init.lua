-- Additional Plugins
lvim.plugins = {
  {
    "NvChad/nvim-base16.lua",
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
    end
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
