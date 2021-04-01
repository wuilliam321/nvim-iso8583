"reload vimrc
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

"files/buffers search
nnoremap <leader>pp  <cmd>lua require('wuilliam321.finders').git_files()<cr>
nnoremap <leader>pf  <cmd>lua require('wuilliam321.finders').project_find()<cr>
nnoremap <leader>pg  <cmd>lua require('wuilliam321.finders').project_grep()<cr>
nnoremap <leader>pb  <cmd>lua require('wuilliam321.finders').buffers()<cr>
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ph  <cmd>lua require('wuilliam321.finders').help_tags()<cr>
nnoremap <leader>di  <cmd>lua require('wuilliam321.finders').buffer_diagnostics()<CR>
nnoremap <leader>bf  <cmd>lua require('wuilliam321.finders').buffer_find()<cr>
nnoremap <leader>ch  <cmd>lua require('wuilliam321.finders').command_history()<cr>
nnoremap <leader>qf  :cclose<cr><bar><cmd>lua require('wuilliam321.finders').quickfix()<cr>
nnoremap <leader>km  <cmd>lua require('wuilliam321.finders').keymaps()<cr>
nnoremap <leader>plg <cmd>lua require('wuilliam321.finders').project_live_grep()<cr>

"harpoon
nnoremap <leader>mb <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>md <cmd>lua require('harpoon.mark').rm_file()<cr>
nnoremap <leader>mp <cmd>lua require('harpoon.mark').promote()<cr>
nnoremap <leader>mc <cmd>lua require('harpoon.mark').clear_all(4)<cr>
nnoremap <leader>mm <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>mq <cmd>lua require('harpoon.ui').to_quickfix_list()<cr>
nnoremap <leader>mu <cmd>lua require('harpoon.ui').nav_file(1)<cr>
nnoremap <leader>me <cmd>lua require('harpoon.ui').nav_file(2)<cr>
nnoremap <leader>mo <cmd>lua require('harpoon.ui').nav_file(3)<cr>
nnoremap <leader>ma <cmd>lua require('harpoon.ui').nav_file(4)<cr>

"code navigation
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> g0    <cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent> gW    <cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent> ]c    <Plug>(GitGutterPrevHunk)
nnoremap <silent> [c    <Plug>(GitGutterNextHunk)
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><C-h>  :cprev<CR>
nnoremap <silent><C-l>  :cnext<CR>
nnoremap <leader>pw     <cmd>lua require('wuilliam321.finders').project_word()<cr>

"remap to prevent leader h to messed
nnoremap <Space>ghp                 @<Plug>(GitGutterPreviewHunk)
nnoremap <Space>ghu                 @<Plug>(GitGutterUndoHunk)
nnoremap <Space>ghs                 @<Plug>(GitGutterStageHunk)
xnoremap <Space>ghs                 @<Plug>(GitGutterStageHunk)

"windows management / navigation
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>

"code actions
nnoremap <silent><nowait><leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><nowait><leader>a  <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent><nowait><leader>ca <cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent><leader>fd <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent><leader>fr <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent><leader>pd <cmd>PrettierAsync<CR>
nnoremap <silent><leader>ss <Plug>(Scalpel)
nnoremap <silent>s= <cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ previewer = false }))<cr>

"git
nmap <silent><leader>gh :diffget //2<CR>
nmap <silent><leader>gl :diffget //3<CR>
nmap <silent><leader>gs :G<CR>
nmap <silent><leader>gc :Git commit<CR>
nmap <silent><leader>u  :UndotreeToggle<CR>
nmap <silent><leader>m  :MaximizerToggle<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> completion#trigger_completion()

" Cheat.sh
nnoremap <script> <silent> <leader>CS :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <script> <silent> <leader>CS :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>

"make Y behave more like C and D
nnoremap Y y$

" Move code
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" esc map
inoremap <C-c> <esc>

"x escapes visual mode
xnoremap x <Esc>

if exists('g:vscode')
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap <silent> gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>
nnoremap <silent> gd :<C-u>call VSCodeNotify('editor.action.peekDefinition')<CR>
xnoremap <silent> K :<C-u>call <SID>hover()<CR>
xnoremap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>
xnoremap <silent> gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>
xnoremap <silent> gd :<C-u>call VSCodeNotify('editor.action.peekDefinition')<CR>
endif
