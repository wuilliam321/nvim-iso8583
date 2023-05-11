vim.opt.termguicolors = true

vim.opt.background = 'dark'
vim.g.gruvbox_contrast_dark = "hard"
-- vim.g.gruvbox_invert_selection = '0'
vim.g.gruvbox_italic = '1'
vim.g.gruvbox_invert_selection = '1'
vim.cmd([[ highlight ColorColumn ctermbg=0 guibg=lightgrey ]])
vim.cmd([[ colorscheme gruvbox ]])

-- vim.g.tokyonight_style = 'dark'
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_lualine_bold = true
-- vim.g.tokyonight_colors = { fg_gutter = '#565f89', bg = '#000000' }
-- vim.cmd([[ colorscheme tokyonight ]])
-- vim.cmd([[ highlight ColorColumn ctermbg=0 guibg='#3b4261' ]])

-- vim.cmd([[ highlight normal guibg=000000 ]])

-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = false,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false, -- Force no bold
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })

-- -- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin-mocha"
