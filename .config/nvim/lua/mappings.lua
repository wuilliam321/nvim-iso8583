local opts = {noremap = true, silent = true, nowait = true}

local mappings = {
  -- find
  {"n", "<leader>pa", "<cmd>lua require('wuilliam321.finders').projects()<cr>", opts},
  {"n", "<leader>pp", "<cmd>lua require('wuilliam321.finders').git_files()<cr>", opts},
  {"n", "<leader>pf", "<cmd>lua require('wuilliam321.finders').project_find()<cr>", opts},
  {"n", "<leader>pg", "<cmd>lua require('wuilliam321.finders').project_grep()<cr>", opts},
  {"n", "<leader>pb", "<cmd>lua require('wuilliam321.finders').buffers()<cr>", opts},
  {"n", "<leader>ff", ":Vex<cr>", opts},
  {"n", "<leader>ph", "<cmd>lua require('wuilliam321.finders').help_tags()<cr>", opts},
  {"n", "<leader>di", "<cmd>lua require('wuilliam321.finders').buffer_diagnostics()<cr>", opts},
  {"n", "<leader>fg", "<cmd>lua require('wuilliam321.finders').buffer_find()<cr>", opts},
  {"n", "<leader>cs", "<cmd>lua require('wuilliam321.finders').cheatsheets({filetype = vim.bo.filetype })<cr>", opts},

  -- windows management / navigation
  {"n", "<leader>h", ":wincmd h<cr>", opts},
  {"n", "<leader>j", ":wincmd j<cr>", opts},
  {"n", "<leader>k", ":wincmd k<cr>", opts},
  {"n", "<leader>l", ":wincmd l<cr>", opts},
  {"n", "<leader>+", ":vertical resize +5<cr>", opts},
  {"n", "<leader>-", ":vertical resize -5<cr>", opts},
  {"n", "<c-w>a",    ":CloseOthers<cr>", opts},
  -- center on next/prev
  {"n", "n", "nztzv", opts},
  {"n", "N", "Nztzv", opts},

  -- code actions
  {"n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts},
  {"n", "<leader>a",  ":Telescope lsp_range_code_actions<cr>", opts},
  {"n", "<leader>ca", ":Telescope lsp_code_actions<cr>", opts},
  {"v", "<leader>a",  ":Telescope lsp_range_code_actions<cr>", opts},
  {"v", "<leader>ca", ":Telescope lsp_code_actions<cr>", opts},
  {"n", "<leader>fd", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts},
  {"v", "<leader>fd", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts},
  {"n", "<leader>pd", "<cmd>PrettierAsync<cr>", opts},
  {"n", "z=", "<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts},

  -- testing/debugging
  {"n", "<leader>da", "<cmd>call vimspector#LaunchWithSettings( #{ configuration: 'app' } )<cr>", opts},
  {"n", "<leader>df", "<cmd>call vimspector#LaunchWithSettings( #{ configuration: 'file' } )<cr>", opts},
  {"n", "<leader>dm", "<cmd>call vimspector#LaunchWithSettings( #{ configuration: 'method', Test: '^' . cfi#format('%s', '') . '$' } )<cr>", opts}, -- uses tyru/current-func-info.vim
  {"n", "<leader>ds", "<cmd>VimspectorReset<cr>", opts},
  {"n", "<leader>bp", "<cmd>call vimspector#ToggleBreakpoint()<cr>", opts},
  {"n", "<leader>dn", "<cmd>call vimspector#StepOver()<cr>", opts},
  {"n", "<leader>dc", "<cmd>call vimspector#Continue()<cr>", opts},

  -- harpoon
  {"n", "<leader>mb", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts},
  {"n", "<leader>md", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts},
  {"n", "<leader>mp", "<cmd>lua require('harpoon.mark').promote()<cr>", opts},
  {"n", "<leader>mc", "<cmd>lua require('harpoon.mark').clear_all(4)<cr>", opts},
  {"n", "<leader>mm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts},
  {"n", "<leader>mq", "<cmd>lua require('harpoon.ui').to_quickfix_list()<cr>", opts},
  {"n", "<leader>mu", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts},
  {"n", "<leader>me", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts},
  {"n", "<leader>mo", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts},
  {"n", "<leader>ma", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts},
  {"n", "<leader>tu", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", opts},
  {"n", "<leader>te", "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", opts},
  {"n", "<leader>to", "<cmd>lua require('harpoon.term').gotoTerminal(3)<cr>", opts},
  {"n", "<leader>ta", "<cmd>lua require('harpoon.term').gotoTerminal(4)<cr>", opts},
  -- {"n", "<u", "<cmd>lua require('harpoon.term').sendCommand(1, 1)<cr>", opts},
  -- {"n", "<leader>ce", "<cmd>lua require('harpoon.term').sendCommand(2, 2)<cr>", opts},
  -- {"n", "<leader>co", "<cmd>lua require('harpoon.term').sendCommand(3, 3)<cr>", opts},
  -- {"n", "<leader>ca", "<cmd>lua require('harpoon.term').sendCommand(4, 4)<cr>", opts},

  -- code navigation
  {"n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts},
  {"n", "gd", "<cmd>lua require('wuilliam321.finders').lsp_definitions()<cr>", opts},
  {"n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts},
  {"n", "gi", "<cmd>lua require('wuilliam321.finders').lsp_implementations()<cr>", opts},
  {"n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts},
  {"n", "gt", "<cmd>lua require('wuilliam321.finders').lsp_type_definitions()<cr>", opts},
  {"n", "gr", "<cmd>lua require('wuilliam321.finders').lsp_references()<cr>", opts},
  {"n", "g0", "<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({}))<cr>", opts},
  {"n", "gW", "<cmd>lua require('wuilliam321.finders').find_symbol()<cr>", opts},
  {"n", "[h", ":GitGutterPrevHunk<cr>zt", opts},
  {"n", "]h", ":GitGutterNextHunk<cr>zt", opts},
  {"n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<cr>zz", opts},
  {"n", "]g", "<cmd>lua vim.diagnostic.goto_next()<cr>zz", opts},
  {"n", "<C-h>", ":cprev<cr>zt", opts},
  {"n", "<C-l>", ":cnext<cr>zt", opts},
  {"n", "<leader>pw", "<cmd>lua require('wuilliam321.finders').project_word()<cr>", opts},
  {"n", "<leader>td", "<cmd>:vsplit<cr><cmd>:e ~/dotfiles/notes.md<cr>", opts},

  -- Git
  {"n", "<leader>gs", ":G<cr>", opts},
  {"n", "<leader>u",  ":UndotreeToggle<cr>", opts},
  {"n", "<leader>m",  ":MaximizerToggle<cr>", opts},
  -- remap to prevent leader h to be messed
  {"n", "<Space>ghp", "@<Plug>(GitGutterPreviewHunk)", opts},
  {"n", "<Space>ghu", "@<Plug>(GitGutterUndoHunk)", opts},
  {"n", "<Space>ghs", "@<Plug>(GitGutterStageHunk)", opts},
  {"x", "<Space>ghs", "@<Plug>(GitGutterStageHunk)", opts},

  -- Misc
  -- make Y behave more like C and D
  {"n", "Y", "y$", opts},
  -- {"i", "<expr><C-k>", "BDG_GetDigraph()", opts},
  -- add more undo beakpoints
  {"i", ",", ",<c-g>u", opts},
  {"i", ".", ".<c-g>u", opts},
  {"i", "!", "!<c-g>u", opts},
  {"i", "?", "?<c-g>u", opts},
  {"i", "<space>", "<space><c-g>u", opts}, -- This make abbreviations not to work
  -- esc map
  {"i", "<C-c>", "<esc>", opts},
  -- {"c", "<C-c>", "<esc>", opts},
  {"t", "<Esc>", "<C-\\><C-n>", opts},
  -- x escapes visual mode
  {"x", "x", "<Esc>", opts},
}

local MODE = 1
local LHS = 2
local RHS = 3
local OPTIONS = 4
local m
for idx = 1, #mappings do
  m = mappings[idx]
  vim.api.nvim_set_keymap(m[MODE], m[LHS], m[RHS], m[OPTIONS])
end
