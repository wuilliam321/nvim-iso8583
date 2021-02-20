augroup css
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
    au BufRead, BufNewFile *.css set filetype=css
augroup END
