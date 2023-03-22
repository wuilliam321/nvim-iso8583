local treesitter = require('nvim-treesitter.configs')
local enable = true

treesitter.setup({
  ensure_installed = {
    'go',
    'javascript',
    'typescript',
    'python',
    'vue',
    'bash',
    'lua',
    'css',
    'html',
    'json',
    'yaml',
    'tsx',
    'hcl',
  },
  highlight = {
    enable = enable,
    -- disable = { "kotlin" },
  },
  incremental_selection = {
    enable = enable,
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      init_selection = 'gnn', -- maps in normal mode to init the node/scope selection
      node_incremental = 'grn', -- increment to the upper named parent
      scope_incremental = 'grc', -- increment to the upper scope (as defined in locals.scm)
      node_decremental = 'grm', -- decrement to the previous node
    },
  },
  textobjects = {
    -- syntax-aware textobjects
    enable = enable,
    lsp_interop = {
      enable = enable,
      peek_definition_code = {
        ['<leader>dF'] = '@function.outer',
        ['<leader>cF'] = '@class.outer',
      },
    },
    move = {
      enable = enable,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {[']m'] = '@function.outer'},
      goto_next_end = {[']M'] = '@function.outer'},
      goto_previous_start = {['[m'] = '@function.outer'},
      goto_previous_end = {['[M'] = '@function.outer'},
    },
    select = {
      enable = enable,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['aC'] = '@class.outer',
        ['iC'] = '@class.inner',
        ['ai'] = '@conditional.outer',
        ['ii'] = '@conditional.inner',
        ['ae'] = '@block.outer',
        ['ie'] = '@block.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['is'] = '@statement.inner',
        ['as'] = '@statement.outer',
        ['ad'] = '@comment.outer',
        ['am'] = '@call.outer',
        ['im'] = '@call.inner',
      },
    },
    swap = {
      enable = enable,
      swap_next = {[']p'] = '@parameter.inner'},
      swap_previous = {['[p'] = '@parameter.inner'},
    },
  },
})
