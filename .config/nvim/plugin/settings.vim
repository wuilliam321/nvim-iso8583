set nocompatible
set rtp+=~/go/bin/fzf
set noshowmatch
set shell=/usr/local/bin/zsh
set number
set relativenumber
set hidden
set nowrap
set smartcase
set smartindent
set incsearch
set nohlsearch
set nobackup
set noswapfile
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set noshowmode
set cmdheight=1
set updatetime=50
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set cursorline
set clipboard=unnamedplus
set inccommand=nosplit
set signcolumn=yes
set colorcolumn=80
set spelllang=es,en
set completeopt=menuone,noinsert,noselect
set omnifunc=v:lua.vim.lsp.omnifunc
set scrolloff=8
set tags=tags

set list
set listchars=nbsp:⦸
set listchars+=tab:▷-
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•
set nojoinspaces

let g:language_client_log_level = '' " debug
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:completion_sorting = "length"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1
let g:completion_trigger_keyword_length = 1
let g:completion_timer_cycle = 80
let g:completion_enable_auto_popup = 1
let g:diagnostic_show_sign = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 1
" let g:CheatSheetBaseUrl='http://localhost:8002'
