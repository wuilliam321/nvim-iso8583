setlocal noexpandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal autowrite

nnoremap <leader>pd :GoImport<CR>

nnoremap <leader>mt <cmd>lua require("harpoon.term").gotoTerminal(1)<CR><cmd>norm I<CR><cmd>lua require("harpoon.term").sendCommand(1, 1)<CR><cmd>lua require("harpoon.term").gotoTerminal(1)<cr>G
nnoremap <leader>mi <cmd>lua require("harpoon.term").sendCommand(1, 3)<CR><cmd>lua require("harpoon.term").gotoTerminal(1)<cr>G
nnoremap <leader>mw <cmd>lua require("harpoon.term").sendCommand(2, 2)<CR><cmd>lua require("harpoon.term").gotoTerminal(2)<cr>G
nnoremap <leader>ga <cmd>lua require("wuilliam321.finders").actions_golang()<cr>

function! s:GoAutocmds()
  augroup GOAutocmds
      autocmd!
      autocmd BufWritePre *.go :lua vim.lsp.buf.format { async = true }
  augroup END
endfunction

call s:GoAutocmds()
