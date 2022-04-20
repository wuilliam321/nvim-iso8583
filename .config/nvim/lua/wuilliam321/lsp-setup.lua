local lspconfig = require'lspconfig'

local language_servers = {
  'html',
  'cssls',
  'vuels',
  'jsonls',
  'pylsp',
  'groovyls',
  'clangd',
  'dockerls',
  'yamlls',
  'terraformls',
  kotlin_language_server = {
    settings = {kotlin = {compiler = {jvm = {target = '1.8'}}}},
    cmd = {
      '/Users/wuilliam.lacruz/Downloads/kotlin-language-server/' ..
        'server/build/install/server/bin/kotlin-language-server',
    },
    filetypes = {'kotlin'},
  },
  gopls = {
    settings = {
      gopls = {
        codelenses = {gc_details = false},
        usePlaceholders = true,
        buildFlags = {'-tags=integration'},
      },
    },
  },
  golangci_lint_ls = {
    init_options = {
      command = {
        'golangci-lint',
        'run',
        '-E',
        'deadcode',
        '-E',
        'errcheck',
        '-E',
        'gosimple',
        '-E',
        'govet',
        '-E',
        'ineffassign',
        '-E',
        'staticcheck',
        '-E',
        'structcheck',
        '-E',
        'typecheck',
        '-E',
        'unused',
        '-E',
        'varcheck',
        '--out-format',
        'json',
      },
    },
  },
  tsserver = {root_dir = lspconfig.util.root_pattern('tsconfig.json', '.git')},
  sumneko_lua = {
    cmd = {
      '/Users/wuilliam.lacruz/Downloads/lua-language-server/' ..
        'bin/lua-language-server',
      '-E',
      '/Users/wuilliam.lacruz/Downloads/lua-language-server/' .. 'main.lua',
    },
    settings = {
      Lua = {diagnostics = {globals = {'vim'}}},
      format = {
        enable = true,
        defaultConfig = {indent_style = 'space', indent_size = '2'},
      },
      diagnostics = {neededFileStatus = {['codestyle-check'] = 'Any'}},
    },
  },
}

vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {spacing = 4, prefix = '~'},
    signs = function(bufnr)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      if not ok then return true end
      return result
    end,
  })

local capabilities = (function()
  local c = vim.lsp.protocol.make_client_capabilities()
  c = require'cmp_nvim_lsp'.update_capabilities(c)
  c.textDocument.completion.completionItem.snippetSupport = true
  c.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'},
  }
  return c
end)()

local on_attach = function(client)
  if client.resolved_capabilities.document_highlight then
    vim.cmd[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd[[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
      augroup END
    ]]
  end
end

for idx, cfg in pairs(language_servers) do
  local lang = cfg
  local opts = {capabilities = capabilities, on_attach = on_attach}
  if cfg ~= nil and type(cfg) == 'table' then
    lang = idx
    opts = vim.tbl_deep_extend('force', opts, cfg)
  end
  lspconfig[lang].setup(opts)
end
