let g:gruvbox_invert_selection='0'
let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set background=dark

" theme remap
nnoremap <silent><leader> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent><leader> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent><leader> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
