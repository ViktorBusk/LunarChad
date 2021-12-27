-- Source: https://github.com/NvChad/NvChad/blob/main/lua/colors/highlights.lua
local cmd = vim.cmd
local colors = require("colors").get()

-- Theme colors
local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local teal = colors.teal
local grey_fg = colors.grey_fg
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local one_bg3 = colors.one_bg3

-- Define bg color
-- @param group Group
-- @param color Color
local function bg(group, color)
  cmd("hi " .. group .. " guibg=" .. color)
end

-- Define fg color
-- @param group Group
-- @param color Color
local function fg(group, color)
  cmd("hi " .. group .. " guifg=" .. color)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
local function fg_bg(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- Comments
if lvim.custom.base16.italic_comments then
  fg("Comment", grey_fg .. " gui=italic")
else
  fg("Comment", grey_fg)
end

-- fg_bg("MatchParen", black, red)

-- Disable bold text for statements (Visable with doxygen highlights)
if not lvim.custom.doxygen_highlight.bold_highlight then
  cmd("hi Statement gui=NONE")
end

-- Disable cusror line
if not lvim.custom.base16.cursor_line then
  cmd "hi clear CursorLine"
end

-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", blue)
bg("NormalFloat", one_bg)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", pmenu_bg)
bg("PmenuThumb", nord_blue)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- misc

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg3 .. " gui=underline")

fg("LineNr", grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

if lvim.transparent_window then
  bg("Normal", "NONE")
  bg("Folded", "NONE")
  fg("Folded", "NONE")
  fg("Comment", grey)
end

-- [[ Plugin Highlights

-- Dashboard
fg("DashboardCenter", grey_fg)
fg("DashboardFooter", grey_fg)
fg("DashboardHeader", grey_fg)
fg("DashboardShortcut", grey_fg)

-- Git signs
fg_bg("DiffAdd", blue, "NONE")
fg_bg("DiffChange", grey_fg, "NONE")
fg_bg("DiffChangeDelete", red, "NONE")
fg_bg("DiffModified", red, "NONE")
fg_bg("DiffDelete", red, "NONE")

-- Indent blankline plugin
fg("IndentBlanklineChar", line)

-- ]]

-- [[ LspDiagnostics

-- Document highlights
if lvim.custom.base16.document_highlight.enable then
  if lvim.custom.base16.document_highlight.bold_highlight then
    bg("LspReferenceRead", one_bg2 .. " gui=bold")
    bg("LspReferenceText", one_bg2 .. " gui=bold")
    bg("LspReferenceWrite", one_bg2 .. " gui=bold")
  else
    bg("LspReferenceRead", one_bg2)
    bg("LspReferenceText", one_bg2)
    bg("LspReferenceWrite", one_bg2)
  end
end

-- NeoVim Nightly
if vim.fn.has "nvim-0.5.1" > 0 then
  -- Main
  fg("DiagnosticError", red);
  fg("DiagnosticWarn", yellow);
  fg("DiagnosticInfo", green);
  fg("DiagnosticHint", purple);

  -- VirtualText
  fg("DiagnosticVirtualTextError", red);
  fg("DiagnosticVirtualTextWarn", yellow);
  fg("DiagnosticVirtualTextInfo", green);
  fg("DiagnosticVirtualTextHint", purple);

  -- Floating
  fg("DiagnosticFloatingError", red);
  fg("DiagnosticFloatingWarn", yellow);
  fg("DiagnosticFloatingInfo", green);
  fg("DiagnosticFloatingHint", purple);

  -- Signs
  fg("DiagnosticSignError", red);
  fg("DiagnosticSignWarn", yellow);
  fg("DiagnosticSignInfo", green);
  fg("DiagnosticSignHint", purple);

  -- Underline
  -- fg("DiagnosticUnderlineError", red);
  -- fg("DiagnosticUnderlineWarn", yellow);
  -- fg("DiagnosticUnderlineInfo", green);
  -- fg("DiagnosticUnderlineHint", purple);

  fg("DiagnosticUnderlineError", "NONE" .. " gui=underline" .. " guisp=" .. red)
  fg("DiagnosticUnderlineWarn", "NONE" .. " gui=underline" .. " guisp=" .. yellow)
  fg("DiagnosticUnderlineInfo", "NONE" .. " gui=underline" .. " guisp=" .. green)
  fg("DiagnosticUnderlineHint", "NONE" .. " gui=underline" .. " guisp=" .. purple)
else
  -- Defualts
  fg("LspDiagnosticsDefaultError", red)
  fg("LspDiagnosticsDefaultWarning", yellow)
  fg("LspDiagnosticsDefaultInformation", green)
  fg("LspDiagnosticsDefaultHint", purple)

  -- VirtualText
  fg("LspDiagnosticsVirtualTextError", red)
  fg("LspDiagnosticsVirtualTextWarning", yellow)
  fg("LspDiagnosticsVirtualTextInformation", green)
  fg("LspDiagnosticsVirtualTextHint", purple)

  -- Floating
  fg("LspDiagnosticsFloatingError", red)
  fg("LspDiagnosticsFloatingWarning", yellow)
  fg("LspDiagnosticsFloatingInformation", green)
  fg("LspDiagnosticsFloatingHint", purple)

  -- Signs
  fg("LspDiagnosticsSignError", red)
  fg("LspDiagnosticsSignWarning", yellow)
  fg("LspDiagnosticsSignInformation", green)
  fg("LspDiagnosticsSignHint", purple)

  -- Main
  fg("LspDiagnosticsError", red)
  fg("LspDiagnosticsWarning", yellow)
  fg("LspDiagnosticsInformation", green)
  fg("LspDiagnosticsHint", purple)

  -- Underline
  fg("LspDiagnosticsUnderlineError", "NONE" .. " gui=underline")
  fg("LspDiagnosticsUnderlineWarning", "NONE" .. " gui=underline")
  fg("LspDiagnosticsUnderlineInformation", "NONE" .. " gui=underline")
  fg("LspDiagnosticsUnderlineHint", "NONE" .. " gui=underline")
end

-- ]]

-- NvimTree
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- LSP
fg("NvimTreeLspDiagnosticsError", red)
fg("NvimTreeLspDiagnosticsWarning", yellow)
fg("NvimTreeLspDiagnosticsInformation", green)
fg("NvimTreeLspDiagnosticsHint", purple)
-- ]]

local section_title_colors = {
   white,
   blue,
   red,
   green,
   yellow,
   purple,
   orange,
}

for i, color in ipairs(section_title_colors) do
   vim.cmd("highlight CheatsheetTitle" .. i .. " guibg = " .. color .. " guifg=" .. black)
end

-- Disable some highlight in nvim tree if transparency enabled
if lvim.transparent_window then
  bg("NormalFloat", "NONE")
  bg("NvimTreeNormal", "NONE")
  bg("NvimTreeNormalNC", "NONE")
  bg("NvimTreeStatusLineNC", "NONE")
  bg("NvimTreeVertSplit", "NONE")
  fg("NvimTreeVertSplit", grey)

  -- telescope
  bg("TelescopeBorder", "NONE")
  bg("TelescopePrompt", "NONE")
  bg("TelescopeResults", "NONE")
  bg("TelescopePromptBorder", "NONE")
  bg("TelescopePromptNormal", "NONE")
  bg("TelescopeNormal", "NONE")
  bg("TelescopePromptPrefix", "NONE")
  fg("TelescopeBorder", one_bg)
  fg_bg("TelescopeResultsTitle", black, blue)
end

-- Telescope
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)

fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)

bg("TelescopeSelection", black2)

-- Whichkey
fg("WhichKey", purple)
fg("WhichKeySeperator", green)
fg("WhichKeyGroup", teal)
fg("WhichKeyDesc", blue)
fg("WhichKeyFloat", one_bg)
