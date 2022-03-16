local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local from_entry = require "telescope.from_entry"
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"

local conf = require("telescope.config").values

-- in lua/finders.lua
local custom_finders = {}

-- Dropdown list theme using a builtin theme definitions :
local no_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  prompt = " > ",
  previewer = false,
})

-- Settings for with preview option
local with_preview = require'telescope.themes'.get_dropdown({
  winblend = 10,
  prompt = " > ",
  results_title = false,
})

custom_finders.cheatsheets = function(opts)
  local _opts = vim.deepcopy(no_preview)
  _opts.filetype = opts.filetype
  _opts.search = vim.fn.input("cht.sh > ")

  local languages = {
    { "go", {filetype = "go", name = "Golang"}},
    { "javascript", {filetype = "js", name = "Javascript"}},
    -- { "typescript", {filetype = "ts", name = "TypeScript"}},
    -- { "typescriptreact", {filetype = "tsx", name = "TypeScript React"}},
    -- { "json", {filetype = "json", name = "JSON"}},
    -- { "python", {filetype = "python", name = "Python"}},
    -- { "ruby", {filetype = "ruby", name = "Ruby"}},
    -- { "shell", {filetype = "shell", name = "Shell"}},
    -- { "yaml", {filetype = "yaml", name = "YAML"}},
    -- { "xml", {filetype = "xml", name = "XML"}},
    { "lua", {filetype = "lua", name = "Lua"}},
  }

  local ft = _opts.filetype
  local query = _opts.search
  query = query:gsub(" ", "+")

  local display_langs = {}
  local current_lang = ""
  for idx = 1, #languages do
    local lang = languages[idx]
    table.insert(display_langs, lang[2])
    if lang[1] == ft then
      current_lang = lang[2]
    end
  end

  if current_lang ~= '' then
    local command = [[/]] .. current_lang.filetype .. [[/]] .. query
    vim.cmd([[silent! Cheat ]] .. command)
  else
    pickers.new(_opts, {
      prompt_title = "Cheat.sh",
      finder = finders.new_table {
        results = display_langs,
        entry_maker = function(entry)
          return {
            value = entry.filetype,
            display = entry.name,
            ordinal = entry.name,
            filename = entry.name,
            cmd = entry.filetype,
          }
        end,
      },
      previewer = previewers.help.new(_opts),
      sorter = conf.generic_sorter(_opts),
      attach_mappings = function(prompt_bufnr)
          action_set.select:replace(function()
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            local command = [[/]] .. entry.cmd .. [[/]] .. query
            vim.cmd([[silent! Cheat ]] .. command)
          end)
          return true
      end,
    }):find()
  end
end

custom_finders.projects = function()
  local opts = vim.deepcopy(no_preview)
  opts.search_dirs = {
    -- '~/w',
    '~/dh',
    '~/go/src/github.com/deliveryhero',
    '~/go/src/github.com/pedidosya',
  }
  opts.find_command = { "fd", "--type", "d", "-d", "1" }
  opts.path_display = {
    shorten = 2,
  }
  opts.attach_mappings = function(prompt_bufnr)
    action_set.select:replace(function()
      local entry = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      local dir = from_entry.path(entry)
      vim.fn.execute("cd " .. dir, "silent")
      vim.schedule(function()
        custom_finders.git_files()
      end)
    end)
    return true
  end
  require'telescope.builtin'.find_files(opts)
end

custom_finders.git_files = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.git_files(opts)
end

custom_finders.project_find = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.find_files(opts)
end

custom_finders.project_grep = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.input("Grep For > ")
  require'telescope.builtin'.grep_string(opts)
end

custom_finders.project_live_grep = function()
  local opts = vim.deepcopy(with_preview)
  require'telescope.builtin'.live_grep(opts)
end

custom_finders.buffers = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.buffers(opts)
end

custom_finders.buffer_find = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.current_buffer_fuzzy_find(opts)
end

custom_finders.command_history = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.command_history(opts)
end

custom_finders.project_word = function()
  local opts = vim.deepcopy(with_preview)
  opts.search = vim.fn.expand("<cword>")
  require'telescope.builtin'.grep_string(opts)
end

custom_finders.find_symbol = function ()
  local opts = vim.deepcopy(with_preview)
  opts.query = vim.fn.expand("<cword>")
  require'telescope.builtin'.lsp_workspace_symbols(opts)
end

custom_finders.quickfix = function()
  local opts = vim.deepcopy(with_preview)
  require'telescope.builtin'.quickfix(opts)
end

custom_finders.help_tags = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.help_tags(opts)
end

custom_finders.keymaps = function()
  local opts = vim.deepcopy(no_preview)
  require'telescope.builtin'.keymaps(opts)
end

custom_finders.buffer_diagnostics = function()
  local opts = vim.deepcopy(no_preview)
  opts.prompt_title = 'Diagnostics'
  vim.lsp.diagnostic.set_loclist()
  vim.cmd [[lclose]]
  require('telescope.builtin').loclist(opts)
end

custom_finders.lsp_definitions = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = 'Definitions/Declarations'
  require('telescope.builtin').lsp_definitions(opts)
end

custom_finders.lsp_implementations = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = 'Implementations'
  require('telescope.builtin').lsp_implementations(opts)
end

custom_finders.lsp_type_definitions = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = 'Type Definitions'
  require('telescope.builtin').lsp_type_definitions(opts)
end

custom_finders.lsp_references = function()
  local opts = vim.deepcopy(with_preview)
  opts.prompt_title = 'References'
  require('telescope.builtin').lsp_references(opts)
end

return custom_finders
