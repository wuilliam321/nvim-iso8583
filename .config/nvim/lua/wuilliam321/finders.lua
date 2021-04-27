-- in lua/finders.lua
local finders = {}

-- Dropdown list theme using a builtin theme definitions :
local no_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  width = 0.5,
  prompt = " > ",
  results_height = 15,
  previewer = false,
  shorten_path = true,
})

-- Settings for with preview option
local with_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  prompt = " > ",
  width = 0.5,
  results_height = 15,
  results_title = false,
  layout_config = {
    preview_width = 0.5,
  },
  shorten_path = true,
})

finders.git_files = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.git_files(opts)
end

finders.project_find = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.find_files(opts)
end

finders.project_grep = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.input("Grep For > ")
  require'telescope.builtin'.grep_string(opts)
end

finders.project_live_grep = function()
  local opts = vim.deepcopy(with_preview)
  require'telescope.builtin'.live_grep(opts)
end

finders.buffers = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.buffers(opts)
end

finders.buffer_find = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.current_buffer_fuzzy_find(opts)
end

finders.command_history = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.command_history(opts)
end

finders.project_word = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.expand("<cword>")
  require'telescope.builtin'.grep_string(opts)
end

finders.quickfix = function()
  local opts = vim.deepcopy(with_preview)
  require'telescope.builtin'.quickfix(opts)
end

finders.help_tags = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.help_tags(opts)
end

finders.keymaps = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.keymaps(opts)
end

finders.buffer_diagnostics = function()
  local opts = vim.deepcopy(no_preview)
  opts.prompt_title = 'Diagnostics'
  vim.lsp.diagnostic.set_loclist()
  vim.cmd [[lclose]]
  require('telescope.builtin').loclist(opts)
end

return finders
