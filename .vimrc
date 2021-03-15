filetype off

let mapleader = " "

call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'wincent/scalpel'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'posva/vim-vue'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x'}
Plug 'tweekmonster/gofmt.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'mechatroner/rainbow_csv'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dbeniamine/cheat.sh-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'buoto/gotests-vim'
call plug#end()

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

lua package.loaded["mylspconfig"] = nil
lua require("mylspconfig")
lua require('nvim-treesitter.configs').setup { highlight = { enable = true } }
