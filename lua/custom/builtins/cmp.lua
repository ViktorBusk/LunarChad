-- CMP
lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }

lvim.builtin.cmp.formatting.format = function(entry, vim_item)
  vim_item.kind = string.format(
    "%s %s",
    lvim.builtin.cmp.formatting.kind_icons[vim_item.kind],
    vim_item.kind
  )
  vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
  vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
    or lvim.builtin.cmp.formatting.duplicates_default
  return vim_item
end

lvim.builtin.cmp.formatting.kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

lvim.builtin.cmp.formatting.source_names = {
  nvim_lsp = "",
  emoji = "",
  path = "",
  calc = "",
  cmp_tabnine = "",
  vsnip = "",
  luasnip = "",
  buffer = "",
}

lvim.builtin.cmp.documentation = {}
