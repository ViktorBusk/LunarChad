-- Onedarker palette
local onedarker = require("onedarker.palette")

local colors = {
   white = onedarker.fg,
   darker_black = onedarker.popup_back,
   black = onedarker.alt_bg, --  nvim bg
   black2 = onedarker.dark,
   one_bg = onedarker.bg, -- real bg of onedark
   one_bg2 = onedarker.alt_bg,
   one_bg3 = onedarker.alt_bg,
   grey = onedarker.dark_gray,
   grey_fg = onedarker.gray,
   grey_fg2 = onedarker.gray,
   light_grey = onedarker.light_gray,
   red = onedarker.red,
   baby_pink = onedarker.magenta,
   pink = onedarker.blue,
   line = onedarker.alt_bg, -- for lines like vertsplit
   green = onedarker.green,
   vibrant_green = onedarker.sign_add,
   nord_blue = onedarker.cyan,
   blue = onedarker.blue,
   yellow = onedarker.yellow,
   sun = onedarker.yellow_orange,
   purple = onedarker.purple,
   dark_purple = onedarker.purple,
   teal = onedarker.cyan,
   orange = onedarker.orange,
   cyan = onedarker.cyan,
   statusline_bg = onedarker.alt_bg,
   lightbg = onedarker.alt_bg,
   lightbg2 = onedarker.fg_gutter,
   pmenu_bg = onedarker.blue,
   folder_bg = onedarker.blue,
   hint_blue = onedarker.hint_blue,
   info_green = onedarker.info_yellow,

}

return colors
