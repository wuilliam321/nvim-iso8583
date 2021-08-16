if !exists('g:vscode')
filetype off

let mapleader = " "

call plug#begin('~/.vim/plugged')
"useful tools
Plug 'mbbill/undotree'
Plug 'wincent/scalpel'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'
Plug 'tweekmonster/gofmt.vim'
Plug 'buoto/gotests-vim'
"external utils
" Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'dbeniamine/cheat.sh-vim'
"code style / completion / helpers
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'mfussenegger/nvim-jdtls'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x'}
Plug 'mechatroner/rainbow_csv'
Plug 'udalov/kotlin-vim'
"telescope/novigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ThePrimeagen/harpoon'
"misc
Plug 'gruvbox-community/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
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

lua require('wuilliam321')
endif
