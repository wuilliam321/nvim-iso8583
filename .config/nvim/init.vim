if !exists('g:vscode')
lua require 'init'

filetype off

let mapleader = " "


highlight ColorColumn ctermbg=0 guibg=lightgrey

set termguicolors
let g:gruvbox_contrast_dark="hard"
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

filetype plugin indent on
syntax on

endif

inoremap <expr>  <C-k>   BDG_GetDigraph()

if exists('g:vscode')
" https://github.com/VSpaceCode/VSpaceCode/issues/34
xmap     gc  <Plug>VSCodeCommentary
nmap     gc  <Plug>VSCodeCommentary
omap     gc  <Plug>VSCodeCommentary
nmap     gcc <Plug>VSCodeCommentaryLine
nnoremap <silent>K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent>gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap <silent>gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>
nnoremap <silent>gd :<C-u>call VSCodeNotify('editor.action.peekDefinition')<CR>
xnoremap <silent>K :<C-u>call <SID>hover()<CR>
xnoremap <silent>gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>
xnoremap <silent>gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>
xnoremap <silent>gd :<C-u>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap <leader>rn :<C-u>call VSCodeNotify('editor.action.rename')<CR>
xnoremap <leader>rn :<C-u>call VSCodeNotify('editor.action.rename')<CR>
nnoremap <leader>gs :<C-u>call VSCodeNotify('workbench.view.scm')<CR>
nnoremap <leader>pb :<C-u>call VSCodeNotify('workbench.action.openRecent')<CR>
nnoremap <leader>pf :<C-u>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap <leader>pp :<C-u>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>tu :<C-u>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>
endif
