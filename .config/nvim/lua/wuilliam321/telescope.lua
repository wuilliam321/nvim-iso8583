local actions = require'telescope.actions'

require'telescope'.setup {
  defaults = {
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
    file_ignore_patterns = { "vendor/.*", "swagger/.*" },

    file_previewer   = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer   = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_vertical,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
}
