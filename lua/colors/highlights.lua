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
local vibrant_green = colors.vibrant_green
local sun = colors.sun
local grey = colors.grey
local teal = colors.teal
local grey_fg = colors.grey_fg
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
-- local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local dark_purple = colors.dark_purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
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

-- Disable cusror line
if not lvim.custom.base16.cursor_line then
  cmd "hi clear CursorLine"
end

-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", one_bg)
bg("NormalFloat", one_bg)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", blue)
bg("PmenuThumb", grey_fg)
fg("CmpItemAbbr", white)
-- fg("CmpItemAbbrMatch", white)
-- fg("CmpItemKind", cmp_grey)
fg("CmpItemMenu", white)
-- fg("CmpDocumentation", white)-- = { fg = C.fg, bg = C.none },
-- fg("CmpDocumentationBorder", one_bg2) --= { fg = C.fg_dark, bg = C.none },
-- fg("CmpItemAbbr", white) -- = { fg = C.fg, bg = C.none },
fg("CmpItemAbbrDeprecated", white) -- = { fg = C.gray, bg = C.none },
fg("CmpItemAbbrMatch", teal) -- = { fg = C.cyan, bg = C.none },
fg("CmpItemAbbrMatchFuzzy", teal) -- = { fg = C.cyan, bg = C.none },
fg("CmpItemKind", purple) -- = { fg = C.blue, bg = C.none },
fg("CmpItemMenu", teal) -- = { fg = C.light_gray, bg = C.none },
-- misc

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg2 .. " gui=underline")

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
fg_bg("DiffAdd", green, "none")
fg_bg("DiffChange", yellow, "none")
fg_bg("DiffDelete", red, "none")
fg_bg("DiffText", yellow, "none")

-- Indent blankline plugin
fg("IndentBlanklineChar", line)

-- ]]

-- [[ LspDiagnostics

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

-- ]]

-- [[ NvimTree

-- General
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- Details
bg("NvimTreeCursorLine", one_bg)
fg("NvimTreeIndentMarker", white)

-- Folders
fg("NvimTreeEmptyFolderName", grey_fg)
fg("NvimTreeFolderIcon", nord_blue)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeOpenedFolderName", blue .. " gui=italic")
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree

-- Files
fg("NvimTreeImageFile", dark_purple)
fg("NvimTreeSpecialFile", sun)
fg("NvimTreeExecFile", vibrant_green)
fg("NvimTreeSymlink", blue)

-- Git
fg("NvimTreeGitNew", green)
fg("NvimTreeGitDirty", green)
fg("NvimTreeGitDeleted", red)
fg("NvimTreeGitMerge", yellow)
fg("NvimTreeGitRenamed", yellow)
fg("NvimTreeGitStaged", green)

-- ]]

-- Disable some highlight in nvim tree if transparency enabled
if lvim.transparent_window then
  bg("NvimTreeNormal", "NONE")
  bg("NvimTreeStatusLineNC", "NONE")
  bg("NvimTreeVertSplit", "NONE")
  fg("NvimTreeVertSplit", grey)
end

-- Telescope
fg("TelescopeBorder", line)
fg("TelescopePreviewBorder", grey)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)

-- Whichkey
fg("WhichKey", purple)
fg("WhichKeySeperator", green)
fg("WhichKeyGroup", teal)
fg("WhichKeyDesc", blue)
fg("WhichKeyFloat", one_bg)
