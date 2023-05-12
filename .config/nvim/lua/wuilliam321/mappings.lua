-- windows management / navigation
local opts = { noremap = true, silent = true, nowait = true }
vim.keymap.set('n', '<leader>h', ':wincmd h<cr>', opts)
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>', opts)
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>', opts)
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>', opts)
vim.keymap.set('n', '<leader>+', ':vertical resize +5<cr>', opts)
vim.keymap.set('n', '<leader>-', ':vertical resize -5<cr>', opts)
vim.keymap.set('n', '<leader>ff', vim.cmd.Ex, opts)

vim.cmd([[ command! CloseOthers execute '%bdelete|edit #|normal `"' ]])
vim.keymap.set('n', '<c-w>a', ':CloseOthers<cr>', opts)

-- center on next/prev
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Misc
-- make Y behave more like C and D
vim.keymap.set('n', 'Y', 'y$', opts)
-- onoremap( 'ao', ':normal! v$%<cr>' , opts)

-- add more undo beakpoints
vim.keymap.set('i', ',', ',<c-g>u', opts)
vim.keymap.set('i', '.', '.<c-g>u', opts)
vim.keymap.set('i', '!', '!<c-g>u', opts)
vim.keymap.set('i', '?', '?<c-g>u', opts)
vim.keymap.set('i', '<space>', '<space><c-g>u', opts) -- This make abbreviations not to work

-- esc map
vim.keymap.set('i', '<C-c>', '<esc>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

-- x escapes visual mode
vim.keymap.set('x', 'x', '<Esc>', opts)
