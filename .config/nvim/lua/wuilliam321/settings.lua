vim.g.mapleader = ' '

vim.g.rtp = os.getenv('HOME') .. '/go/bin/fzf'
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.title = true
vim.opt.more = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.inccommand = 'nosplit'
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = {80, 120}
vim.wo.spell = false
vim.opt.spelllang = {'en', 'es'}
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
vim.opt.scrolloff = 8
vim.opt.tags = 'tags'
vim.opt.shortmess:append('c')

vim.opt.list = true
vim.opt.listchars:append({ tab = '▷-', extends = '»', precedes = '«', trail = '•' })
-- vim.opt.listchars:append({ nbsp = '␣', space = '␣', tab = '▷-', extends = '»', precedes = '«', trail = '•', eol = '↲' })
vim.opt.joinspaces = false

vim.g.language_client_log_level = '' -- debug

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- vim.g.netrw_sort_by='time'
-- vim.g.netrw_sort_direction='reverse'
-- vim.g.netrw_sort_options = 'i'

vim.g.completion_sorting = 'length'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.completion_matching_smart_case = 1
vim.g.completion_trigger_keyword_length = 1
vim.g.completion_enable_auto_popup = 1
-- vim.g.completion_timer_cycle = 80

vim.g.diagnostic_show_sign = 1
vim.g.diagnostic_insert_delay = 1
vim.g.diagnostic_enable_virtual_text = 1

