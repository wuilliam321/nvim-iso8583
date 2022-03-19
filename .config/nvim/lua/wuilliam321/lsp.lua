local lspconfig = require'lspconfig'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,

    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '~',
    },

    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,

    -- Disable a feature
    update_in_insert = false,
  }
)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local kotlin_server_path = "/Users/wuilliam.lacruz/Downloads/kotlin-language-server/"
lspconfig.kotlin_language_server.setup{
  settings = {
    kotlin = {
      compiler = {
        jvm = {
          target = "1.8";
        }
      };
    };
  },
  cmd = {
    kotlin_server_path .. "server/build/install/server/bin/kotlin-language-server"
  },
  filetypes = { "kotlin" },
  capabilities=capabilities
}
lspconfig.html.setup{capabilities=capabilities}
lspconfig.cssls.setup{capabilities=capabilities}
lspconfig.vuels.setup{capabilities=capabilities}
lspconfig.gopls.setup{capabilities=capabilities}
lspconfig.golangci_lint_ls.setup{
  init_options = {
    command = {
     'golangci-lint', 'run',
     '-E', 'deadcode', '-E', 'errcheck', '-E', 'gosimple', '-E', 'govet',
     '-E', 'ineffassign', '-E', 'staticcheck', '-E', 'structcheck',
     '-E', 'typecheck', '-E', 'unused', '-E', 'varcheck',
     '--out-format', 'json'
    },
  },
  capabilities=capabilities
}
lspconfig.jsonls.setup{capabilities=capabilities}
lspconfig.pylsp.setup{capabilities=capabilities}
lspconfig.groovyls.setup{capabilities=capabilities}
lspconfig.clangd.setup{capabilities=capabilities}
lspconfig.dockerls.setup{capabilities=capabilities}
lspconfig.yamlls.setup{capabilities=capabilities}
lspconfig.terraformls.setup{capabilities=capabilities}
lspconfig.tsserver.setup{
  root_dir = lspconfig.util.root_pattern("tsconfig.json", ".git"),
  capabilities=capabilities
}
local lua_server_path = "/Users/wuilliam.lacruz/Downloads/lua-language-server/"
lspconfig.sumneko_lua.setup{
  cmd = {
    lua_server_path .. "bin/macOS/lua-language-server", "-E",
    lua_server_path .. "main.lua"
  },
  capabilities=capabilities,
  settings = {
      Lua = {
          diagnostics = {
              globals = { 'vim' }
          }
      }
  }
}


