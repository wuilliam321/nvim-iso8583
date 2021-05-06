local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = {"kotlin"},
  highlight = {
    enable = true,
    -- disable = { "kotlin" },
  }
}
