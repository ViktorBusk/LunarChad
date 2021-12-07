local modules = {
  "custom.builtins.cmp",
  "custom.builtins.dashboard",
  "custom.builtins.others",
  "custom.builtins.telescope",
  "custom.builtins.treesitter",
  "custom.builtins.nvimtree",
  "custom.builtins.gitsigns",
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end
