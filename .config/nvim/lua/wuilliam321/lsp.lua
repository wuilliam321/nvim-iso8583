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

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


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
  on_attach=on_attach_vim,
  filetypes = { "kotlin", "kt" }
}
lspconfig.html.setup{on_attach=on_attach_vim,capabilities=capabilities}
lspconfig.cssls.setup{on_attach=on_attach_vim,capabilities=capabilities}
lspconfig.vuels.setup{on_attach=on_attach_vim}
lspconfig.gopls.setup{on_attach=on_attach_vim}
lspconfig.jsonls.setup{on_attach=on_attach_vim}
lspconfig.pyls.setup{on_attach=on_attach_vim}
-- lspconfig.jdtls.setup{on_attach=on_attach_vim}
lspconfig.groovyls.setup{on_attach=require'completion'.on_attach}
lspconfig.clangd.setup{on_attach=on_attach_vim}
lspconfig.tsserver.setup{
  root_dir = lspconfig.util.root_pattern("tsconfig.json", ".git"),
  on_attach=on_attach_vim
}
local lua_server_path = "/Users/wuilliam.lacruz/Downloads/lua-language-server/"
lspconfig.sumneko_lua.setup{
  cmd = {
    lua_server_path .. "bin/macOS/lua-language-server", "-E",
    lua_server_path .. "main.lua"
  },
  on_attach=on_attach_vim
}

