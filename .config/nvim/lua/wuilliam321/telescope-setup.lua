local actions = require'telescope.actions'

require'telescope'.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--no-ignore',
    },
    color_devicons = true,
    file_ignore_patterns = {
      '.git/.*',
      'dist/.*',
      'node_modules/.*',
      'vendor/.*',
      'swagger/.*',
      'build/.*',
    },
    -- file_ignore_patterns = { "vendor/.*", "swagger/.*" , "build/.*" },

    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    mappings = {i = {['<C-q>'] = actions.send_to_qflist}},
  },
  extensions = {
    fzf = {
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    file_browser = {
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require'telescope'.load_extension('refactoring')
require'telescope'.load_extension('fzf')
require'telescope'.load_extension('file_browser')
