lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
}
EOF

"reload vimrc
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

" Open files / find files
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pp  <cmd>lua require('finders').git_files()<cr>
nnoremap <leader>pf  <cmd>lua require('finders').project_find()<cr>
nnoremap <leader>pg  <cmd>lua require('finders').project_grep()<cr>
nnoremap <leader>plg <cmd>lua require('finders').project_live_grep()<cr>
nnoremap <leader>pb  <cmd>lua require('finders').buffers()<cr>
nnoremap <leader>bf  <cmd>lua require('finders').buffer_find()<cr>
nnoremap <leader>ch  <cmd>lua require('finders').command_history()<cr>
nnoremap <leader>pw  <cmd>lua require('finders').project_word()<cr>
nnoremap <leader>qf  :cclose<cr><bar><cmd>lua require('finders').quickfix()<cr>
nnoremap <leader>ph  <cmd>lua require('finders').help_tags()<cr>
" nnoremap <leader>km  <cmd>lua require('finders').keymaps()<cr>
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" omap ic <Plug>(coc-classobj-i)
" omap ac <Plug>(coc-classobj-a)
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ig <Plug>(coc-git-chunk-inner)
" xmap ig <Plug>(coc-git-chunk-inner)
" omap ag <Plug>(coc-git-chunk-outer)
" xmap ag <Plug>(coc-git-chunk-outer)
omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
xmap ic <Plug>(GitGutterTextObjectInnerVisual)
xmap ac <Plug>(GitGutterTextObjectOuterVisual)

nnoremap <silent> gD                 <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd                 <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K                  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi                 <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>              <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt                 <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr                 <cmd>lua vim.lsp.buf.references()<cr>
" nnoremap <silent> gr                 <cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<CR>
" nnoremap <silent> g0                 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> g0                 <cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({}))<CR>
" nnoremap <silent> gW                 <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gW                 <cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent> [g                 <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ]g                 <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> z=                 <cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ previewer = false }))<cr>
nnoremap  <Space>ghp    @<Plug>(GitGutterPreviewHunk)
nnoremap  <Space>ghu    @<Plug>(GitGutterUndoHunk)
nnoremap  <Space>ghs    @<Plug>(GitGutterStageHunk)
xnoremap  <Space>ghs    @<Plug>(GitGutterStageHunk)
nmap              ]c                 <Plug>(GitGutterPrevHunk)
nmap              [c                 <Plug>(GitGutterNextHunk)
nnoremap <silent><leader>fd          <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent><leader>fr          <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent><leader>pd          <cmd>PrettierAsync<CR>
nnoremap <silent><leader>+           :vertical resize +5<CR>
nnoremap <silent><leader>-           :vertical resize -5<CR>
nnoremap <silent><leader>h           :wincmd h<CR>
nnoremap <silent><leader>j           :wincmd j<CR>
nnoremap <silent><leader>k           :wincmd k<CR>
nnoremap <silent><leader>l           :wincmd l<CR>
nnoremap <silent><nowait><leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><nowait><leader>a   <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent><nowait><leader>ra  <cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent><nowait><leader>di  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nmap <silent><leader>gh              :diffget //2<CR>
nmap <silent><leader>gl              :diffget //3<CR>
nmap <silent><leader>gs              :G<CR>
nmap <silent><leader>gc              :Gcommit<CR>
nmap <silent><leader>u               :UndotreeToggle<CR>
nmap <silent><leader>ss              <Plug>(Scalpel)
nmap <silent><leader>m               :MaximizerToggle<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent><C-up>            :cprev<CR>
nnoremap <silent><C-down>          :cnext<CR>

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ completion#trigger_completion()

inoremap <silent><expr> <c-space> completion#trigger_completion()

"make Y behave more like C and D
nnoremap Y y$

" Move code
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" esc map
inoremap <C-c> <esc>
" inoremap hh <esc> :w<CR>

"x escapes visual mode
xnoremap x <Esc>
