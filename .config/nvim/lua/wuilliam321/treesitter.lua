local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = {"go", "javascript", "typescript", "python", "vue", "bash", "lua", "css", "html", "json", "yaml"},
  highlight = {
    enable = true,
    -- disable = { "kotlin" },
  }
}
