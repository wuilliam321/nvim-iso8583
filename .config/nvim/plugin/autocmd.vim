function! s:WAutocmds()
  fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun
  augroup WAutocmds
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
      autocmd BufWritePre * :call TrimWhitespace()
      autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
      autocmd FileType gitcommit setlocal spell
      autocmd FileType gitcommit setlocal complete+=kspell
      " autocmd BufWrite *.lua call LuaFormat()
      autocmd FileType lua autocmd! BufWritePre <buffer> call LuaFormat()
      " autocmd FileType go autocmd! BufWritePre <buffer> GoImport
      " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
      " autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
      au FileType * if !(&ft == "") | setlocal signcolumn=yes | endif
  augroup END
endfunction

call s:WAutocmds()
