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
      " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
      " autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
  augroup END

  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}, root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml'})})
  augroup end
endfunction

call s:WAutocmds()
