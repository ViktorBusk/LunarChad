-- Dashboard
lvim.builtin.dashboard = {
  active = true,
  on_config_done = nil,
  search_handler = "telescope",
  disable_at_vim_enter = 0,
  session_directory = require("lvim.utils").join_paths(get_cache_dir(), "sessions"),
  custom_header = {
                          "                                   ",
                          "                                   ",
                          "                                   ",
                          "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
                          "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
                          "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
                          "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
                          "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
                          "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
                          "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
                          " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
                          " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
                          "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
                          "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
                          "                                   ",
  },
  custom_section = {
    a = { description = { "  find file                  SPC f  " }, command = "Telescope find_files" },
    b = { description = { "  recents                    SPC s r" }, command = "Telescope oldfiles" },
    c = { description = { "  find word                  SPC s t" }, command = "Telescope live_grep" },
    d = { description = { "洛 new file                   SPC d f" }, command = "DashboardNewFile" },
    e = { description = { "  bookmarks                  SPC s b" }, command = "Telescope marks" },
    f = { description = { "  load last session          SPC l  " }, command = "SessionLoad" },
    g = { description = { "  edit config                SPC _  " }, command = "e ~/.config/lvim/config.lua"},
  },
  footer = { "" },
}

require("lvim.core.dashboard").setup = function()
  vim.g.dashboard_disable_at_vimenter = lvim.builtin.dashboard.disable_at_vim_enter
  vim.g.dashboard_custom_header = lvim.builtin.dashboard.custom_header
  vim.g.dashboard_default_executive = lvim.builtin.dashboard.search_handler
  vim.g.dashboard_custom_section = lvim.builtin.dashboard.custom_section
  lvim.builtin.which_key.mappings[";"] = { "<cmd>Dashboard<CR>", "Dashboard" }

  vim.g.dashboard_custom_footer = {""}
  require("lvim.core.autocmds").define_augroups {
    _dashboard = {
      -- seems to be nobuflisted that makes my stuff disappear will do more testing
      {
        "filetype",
        "dashboard",
        "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
      },
      {
        "filetype",
        "dashboard",
        "set showtabline=0 | autocmd bufleave <buffer> set showtabline=" .. vim.opt.showtabline._value,
      },
      { "filetype", "dashboard", "nnoremap <silent> <buffer> q :q<cr>" },
    },
  }

  if lvim.builtin.dashboard.on_config_done then
    lvim.builtin.dashboard.on_config_done()
  end
end
