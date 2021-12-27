-- generic LSP settings
lvim.format_on_save = false
lvim.lsp.automatic_servers_installation = true

lvim.lsp.diagnostics.signs = {
  active = true,
  values = {
    { name = "LspDiagnosticsSignError", text = "" },
    { name = "LspDiagnosticsSignWarning", text = "" },
    { name = "LspDiagnosticsSignHint", text = "" },
    { name = "LspDiagnosticsSignInformation", text = "" }
  }
}

lvim.lsp.diagnostics.virtual_text = true
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.diagnostics.underline = true
lvim.lsp.diagnostics.severity_sort = true
lvim.builtin.nvimtree.setup.diagnostics.enable = false

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>

lvim.lsp.on_attach_callback = function(client, bufnr)
  -- HACK: This is a temp fix for symbols not working
  local function set_signs()

    local LSP_DEPRECATED_SIGN_MAP = {
      ["LspDiagnosticsSignError"] = "DiagnosticSignError",
      ["LspDiagnosticsSignWarning"] = "DiagnosticSignWarn",
      ["LspDiagnosticsSignHint"] = "DiagnosticSignHint",
      ["LspDiagnosticsSignInformation"] = "DiagnosticSignInfo",
    }

    for _, sign in ipairs(lvim.lsp.diagnostics.signs.values) do
      local lsp_sign_name = LSP_DEPRECATED_SIGN_MAP[sign.name]
      if vim.fn.has "nvim-0.5.1" > 0 and lsp_sign_name then
        vim.fn.sign_define(lsp_sign_name, { texthl = lsp_sign_name, text = sign.text, numhl = lsp_sign_name })
      end
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end
  end

  set_signs()
end

-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- More information: https://www.lunarvim.org/languages
-- lvim.lang.python.formatters = { { exe = "black" } }

-- lvim.lang.lua.formatters = {
--   {
--     exe = "lua-format",
--     args = {
--       "--indent-width", lvim.custom.tab, "--spaces-inside-table-braces",
--       "--no-chop-down-table", "--no-keep-simple-function-one-line",
--       "--no-keep-simple-control-block-one-line",
--       "--single-quote-to-double-quote"
--     }
--   }
-- }

-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }
