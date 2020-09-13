" if has("nvim-0.5.0")
let g:language_client_log_level = 'debug'

lua package.loaded["mylspconfig"] = nil
lua require("mylspconfig")

function! LSPRename()
    let s:newName = input('Enter new name: ', expand('<cword>'))
    echom "s:newName = " . s:newName
    lua vim.lsp.buf.rename(s:newName)
endfunction

function! LSPSetMappings()
    setlocal omnifunc=v:lua.vim.lsp.omnifunc

    nnoremap <buffer>gD           <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <buffer>gd           <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <buffer>K            <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <buffer>gi           <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <buffer><c-k>        <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <buffer>gt           <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <buffer>gr           <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <buffer>g0           <cmd>lua vim.lsp.buf.document_symbol()<CR>
    nnoremap <buffer>gW           <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    nnoremap <buffer><F2>         :call LSPRename()<CR>

    nnoremap <buffer>[g           <cmd>NextDiagnosticCycle<CR>
    nnoremap <buffer>]g           <cmd>PrevDiagnosticCycle<CR>
    nnoremap <nowait><leader>di  <cmd>OpenDiagnostic<CR>

    nnoremap <nowait><leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <nowait><leader>a   <cmd>lua vim.lsp.buf.code_action()<CR>

    nnoremap <leader>fd           <cmd>lua vim.lsp.buf.formatting()<CR>
    nnoremap <leader>pd           <cmd>PrettierAsync<CR>


    " Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    "map <c-p> to manually trigger completion
    inoremap <silent><expr> <c-p> completion#trigger_completion()

    " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect
    let g:completion_sorting = "length"
    "let g:completion_enable_snippet = 'vim-vsnip'
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
    " Avoid showing message extra message when using completion
    set shortmess+=c

    let g:diagnostic_show_sign = 0
    let g:diagnostic_insert_delay = 1
    let g:diagnostic_enable_virtual_text = 1
endfunction

" au FileType lua,sh,c,python,rust :call LSPSetMappings()
au FileType * :call LSPSetMappings()
" endif
