local M = {}

-- Dropdown list theme using a builtin theme definitions :
M.no_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  prompt = ' > ',
  previewer = false,
  path_display = {truncate = 1},
  layout_config = {width = 180},
})

-- Settings for with preview option
M.with_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  prompt = ' > ',
  results_title = false,
  path_display = {truncate = 1},
  layout_config = {width = 180},
})

return M
