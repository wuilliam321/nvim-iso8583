setlocal noexpandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal autowrite

nnoremap <leader>pd :GoImport<CR>

nnoremap <leader>mt <cmd>lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>mw <cmd>lua require("harpoon.term").sendCommand(2, 2)<CR>
nnoremap <leader>ga <cmd>lua require("wuilliam321.finders").actions_golang()<cr>
