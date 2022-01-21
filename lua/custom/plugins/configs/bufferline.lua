-- Source: https://github.com/NvChad/NvChad/blob/main/lua/plugins/configs/bufferline.lua
local theme_colors = require("colors").get()

local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    buffer_close_icon = "",
    modified_icon = "",
    -- close_icon = "%@NvChad_bufferline_quitvim@%X",
    close_icon = "",
    show_close_icon = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = false, -- "or nvim_lsp"
    custom_filter = function(buf_number)
       -- Func to filter out our managed/persistent split terms
       local present_type, type = pcall(function()
          return vim.api.nvim_buf_get_var(buf_number, "term_type")
       end)

       if present_type then
          if type == "vert" then
             return false
          elseif type == "hori" then
             return false
          else
             return true
          end
       else
          return true
       end
    end,
  },
  highlights = {
    background = {
       guifg = theme_colors.grey_fg,
       guibg = theme_colors.black2,
    },

    -- Buffers
    buffer_selected = {
       guifg = theme_colors.white,
       guibg = theme_colors.black,
       gui = "bold",
    },
    buffer_visible = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.black2,
    },

    -- For diagnostics = "nvim_lsp"
    error = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.black2,
    },
    error_diagnostic = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.black2,
    },

    -- Close buttons
    close_button = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.black2,
    },
    close_button_visible = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.black2,
    },
    close_button_selected = {
       guifg = theme_colors.red,
       guibg = theme_colors.black,
    },
    fill = {
       guifg = theme_colors.grey_fg,
       guibg = theme_colors.black2,
    },
    indicator_selected = {
       guifg = theme_colors.black,
       guibg = theme_colors.black,
    },

    -- Modified
    modified = {
       guifg = theme_colors.red,
       guibg = theme_colors.black2,
    },
    modified_visible = {
       guifg = theme_colors.red,
       guibg = theme_colors.black2,
    },
    modified_selected = {
       guifg = theme_colors.green,
       guibg = theme_colors.black,
    },

    -- Separators
    separator = {
       guifg = theme_colors.black2,
       guibg = theme_colors.black2,
    },
    separator_visible = {
       guifg = theme_colors.black2,
       guibg = theme_colors.black2,
    },
    separator_selected = {
       guifg = theme_colors.black2,
       guibg = theme_colors.black2,
    },
    -- Tabs
    tab = {
       guifg = theme_colors.light_grey,
       guibg = theme_colors.one_bg3,
    },
    tab_selected = {
       guifg = theme_colors.black2,
       guibg = theme_colors.nord_blue,
    },
    tab_close = {
       guifg = theme_colors.red,
       guibg = theme_colors.black,
    },
 },
}
