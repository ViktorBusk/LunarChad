local present, todo_comments = pcall(require, "todo-comments")
if not present then
  return
end

todo_comments.setup {
  signs = false,
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {} -- list of file types to exclude highlighting
  },
  search = {
    command = "rg",
    args = {
      "--color=never", "--no-heading", "--with-filename", "--line-number",
      "--column"
    },
    pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]]
  }
}

