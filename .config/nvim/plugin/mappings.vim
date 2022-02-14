"reload vimrc
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>

"files/buffers search
nnoremap <leader>pp  <cmd>lua require('wuilliam321.finders').git_files()<cr>
nnoremap <leader>pf  <cmd>lua require('wuilliam321.finders').project_find()<cr>
nnoremap <leader>pg  <cmd>lua require('wuilliam321.finders').project_grep()<cr>
nnoremap <leader>pb  <cmd>lua require('wuilliam321.finders').buffers()<cr>
nnoremap <leader>ff  :Vex<CR>
nnoremap <leader>ph  <cmd>lua require('wuilliam321.finders').help_tags()<cr>
nnoremap <leader>di  <cmd>lua require('wuilliam321.finders').buffer_diagnostics()<CR>
nnoremap <leader>fg  <cmd>lua require('wuilliam321.finders').buffer_find()<cr>
nnoremap <leader>ch  <cmd>lua require('wuilliam321.finders').command_history()<cr>
" nnoremap <leader>qf  :cclose<cr><bar><cmd>lua require('wuilliam321.finders').quickfix()<cr>
" nnoremap <leader>km  <cmd>lua require('wuilliam321.finders').keymaps()<cr>
" nnoremap <leader>plg <cmd>lua require('wuilliam321.finders').project_live_grep()<cr>

"testing/debugging
nnoremap <leader>da <cmd>call vimspector#LaunchWithSettings( #{ configuration: "app" } )<cr>
nnoremap <leader>df <cmd>call vimspector#LaunchWithSettings( #{ configuration: "file" } )<cr>
nnoremap <leader>dm <cmd>call vimspector#LaunchWithSettings( #{ configuration: "method", Test: "^" . cfi#format("%s", "") . "$" } )<cr>
nnoremap <leader>ds <cmd>VimspectorReset<cr>
nnoremap <leader>bp <cmd>call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>n <cmd>call vimspector#StepOver()<cr>
nnoremap <leader>c <cmd>call vimspector#Continue()<cr>


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
nnoremap <leader>tu <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>te <cmd>lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <leader>to <cmd>lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap <leader>ta <cmd>lua require("harpoon.term").gotoTerminal(4)<CR>
nnoremap <leader>cu <cmd>lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <leader>ce <cmd>lua require("harpoon.term").sendCommand(2, 2)<CR>
nnoremap <leader>co <cmd>lua require("harpoon.term").sendCommand(3, 3)<CR>
nnoremap <leader>ca <cmd>lua require("harpoon.term").sendCommand(4, 4)<CR>

"code navigation
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua require('wuilliam321.finders').lsp_definitions()<cr>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua require('wuilliam321.finders').lsp_implementations()<cr>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua require('wuilliam321.finders').lsp_type_definitions()<CR>
nnoremap <silent> gr    <cmd>lua require('wuilliam321.finders').lsp_references()<cr>
nnoremap <silent> g0    <cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({}))<CR>
" nnoremap <silent> gW    <cmd>lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent> gW    <cmd>lua require('wuilliam321.finders').find_symbol()<cr>
nnoremap <silent> [h    :GitGutterPrevHunk<CR>zt
nnoremap <silent> ]h    :GitGutterNextHunk<CR>zt
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz
nnoremap <silent><C-h>  :cprev<CR>zt
nnoremap <silent><C-l>  :cnext<CR>zt
nnoremap <leader>pw     <cmd>lua require('wuilliam321.finders').project_word()<cr>
nnoremap <leader>td     <cmd>:vsplit<CR><cmd>:e ~/dotfiles/notes.md<CR>

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
nnoremap <silent><c-w>a    :CloseOthers<CR>

"code actions
nnoremap <silent><nowait><leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent><nowait><leader>a  <cmd>lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_dropdown({}))<CR>
" nnoremap <silent><nowait><leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <silent><leader>a  :Telescope lsp_range_code_actions<CR>
nnoremap <silent><leader>ca :Telescope lsp_code_actions<CR>
vnoremap <silent><leader>a  :Telescope lsp_range_code_actions<CR>
vnoremap <silent><leader>ca :Telescope lsp_code_actions<CR>
nnoremap <silent><leader>fd <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <silent><leader>fd <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent><leader>pd <cmd>PrettierAsync<CR>
nnoremap <silent>z= <cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ previewer = false }))<cr>
nmap <Leader>ss <Plug>(Scalpel)

"git
nmap <silent><leader>gh :diffget //2<CR>
nmap <silent><leader>gl :diffget //3<CR>
nmap <silent><leader>gs :G<CR>
nmap <silent><leader>gc :Git commit<CR>
nmap <silent><leader>u  :UndotreeToggle<CR>
nmap <silent><leader>m  :MaximizerToggle<CR>

" " compe
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" snippets
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Cheat.sh
nnoremap <script> <silent> <leader>CS :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <script> <silent> <leader>CS :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>

"make Y behave more like C and D
nnoremap Y y$

"center on next/prev
nnoremap n nztzv
nnoremap N Nztzv

" add more undo beakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move code
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" esc map
inoremap <C-c> <esc>
tnoremap <Esc> <C-\><C-n>

inoremap <expr>  <C-k>   BDG_GetDigraph()
" inoremap <expr>  <C-k>   HUDG_GetDigraph()

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
