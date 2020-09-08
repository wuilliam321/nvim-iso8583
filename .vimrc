filetype off

let mapleader = " "

set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

call plug#begin('~/.vim/plugged')
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/vim-apm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'wincent/scalpel'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'posva/vim-vue'
" Plug 'vim-syntastic/syntastic'
" Plug 'sekel/vim-vue-syntastic'
" Plug 'Quramy/tsuquyomi'
" Plug 'tweekmonster/gofmt.vim'
" Plug 'mikelue/vim-maven-plugin'
" Plug 'sebdah/vim-delve'
" Plug 'SirVer/ultisnips'
" Plug 'mlaursen/vim-react-snippets'
" Plug 'PsychoLlama/snake.vim'
" Plug 'airblade/vim-rooter'
" Plug 'phanviet/vim-monokai-pro'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
call plug#end()

filetype plugin indent on
syntax on

