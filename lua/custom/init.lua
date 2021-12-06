local modules = {
	"custom/keymappings",
	"custom/options",
	"custom/builtins",
	"custom/lsp",
	"custom/plugins",
	"custom/autocmds",
	"custom/neovide",
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end

require("custom.utils").on_init()
