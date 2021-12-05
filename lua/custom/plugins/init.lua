-- Additional Plugins
lvim.plugins = {
  {
    "folke/lsp-colors.nvim"
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("custom.plugins.configs.neoscroll")
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
    "iamcco/markdown-preview.nvim",
    config = function()
      require("custom.plugins.configs.markdown")
    end
  },
  {
    "easymotion/vim-easymotion",
    config = function()
      require("custom.plugins.configs.easymotion")
    end
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("custom.plugins.configs.todo")
    end
  },
  {
    "NvChad/nvim-base16.lua",
    config = function()
      if lvim.custom.base16.enable then
        require("colors").init()
      end
    end,
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
