-- https://salferrarello.com/vim-close-all-buffers-except-the-current-one/
vim.cmd([[ command! CloseOthers execute '%bdelete|edit #|normal `"' ]])
