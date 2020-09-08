function! s:WAutocmds()
  fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun

  augroup WAutocmds
      autocmd!
      autocmd VimEnter * :VimApm
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
      autocmd BufWritePre * :call TrimWhitespace()
      "autocmd CursorHold * silent call CocActionAsync('highlight')
      "autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
      autocmd FileType markdown setlocal spell
      autocmd FileType gitcommit setlocal complete+=kspell
  augroup END
endfunction

call s:WAutocmds()
