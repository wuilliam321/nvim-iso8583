local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local m_opts = { noremap = true, silent = true, nowait = true }

return require("packer").startup(function(use)
    use('wbthomason/packer.nvim')

    -- lsp
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
            { 'onsails/lspkind.nvim' },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.cmd [[
                    augroup lsp_document_highlight
                        autocmd! * <buffer>
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                    augroup END
                ]]

                vim.cmd [[
                    augroup lsp_document_codelens
                        au! * <buffer>
                        autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
                        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
                    augroup END
                ]]

                vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, m_opts)
                vim.keymap.set('n', '<leader>pd', vim.lsp.buf.format, m_opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, m_opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, m_opts)
                vim.keymap.set('n', '<C-h>', '<cmd>cprev<cr>zz', m_opts)
                vim.keymap.set('n', '<C-l>', '<cmd>cnext<cr>zz', m_opts)

                vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>zz', m_opts)
                vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>zz', m_opts)
            end)

            lsp.ensure_installed({
                'lua_ls',
                'gopls',
                'golangci_lint_ls',
                'tsserver',
                'rust_analyzer',
            })

            lsp.use('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            lsp.use('gopls', {
                settings = {
                    gopls = {
                        codelenses = { gc_details = false },
                        usePlaceholders = true,
                        buildFlags = { '-tags=integration' },
                    },
                },
            })

            lsp.setup()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer',     keyword_length = 3 },
                    { name = 'luasnip',    keyword_length = 2 },
                    { name = 'cmp_tabnine' },
                },
                mapping = {
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                formatting = {
                    -- onsails/lspkind-nvim
                    format = function(entry, vim_item)
                        local source_mapping = {
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            nvim_lua = '[Lua]',
                            cmp_tabnine = '[TN]',
                            luasnip = '[Snippet]',
                            path = '[Path]',
                        }

                        local lspkind = require('lspkind')
                        if not lspkind then
                            return
                        end

                        vim_item.kind = lspkind.symbolic(vim_item.kind, {
                            mode = "symbol",
                            ellipsis_char = '...',
                        })
                        vim_item.menu = source_mapping[entry.source.name]
                        if entry.source.name == "cmp_tabnine" then
                            local detail = (entry.completion_item.labelDetails or {}).detail
                            vim_item.kind = ""
                            if detail and detail:find('.*%%.*') then
                                vim_item.kind = vim_item.kind .. ' ' .. detail
                            end

                            if (entry.completion_item.data or {}).multiline then
                                vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
                            end
                        end
                        local maxwidth = 50
                        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
                        return vim_item
                    end,
                },
            })

            vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = { spacing = 4, prefix = '~' },
                    signs = function(bufnr)
                        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
                        if not ok then return true end
                        return result
                    end,
                }
            )
        end
    }

    -- navigation
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim' }
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup {
                defaults = {
                    mappings = { i = { ['<C-q>'] = actions.send_to_qflist } },
                },
                extensions = {
                    ['ui-select'] = { require('wuilliam321.finders').no_preview },
                },
            }

            telescope.load_extension('refactoring')
            telescope.load_extension('ui-select')
            telescope.load_extension('fzf')

            local finders = require("wuilliam321.finders")
            vim.keymap.set('n', '<leader>pp', finders.git_files, m_opts)
            vim.keymap.set('n', '<leader>pf', finders.find_files, m_opts)
            vim.keymap.set('n', '<leader>pb', finders.buffers, m_opts)
            vim.keymap.set('n', '<leader>pg', finders.grep_string, m_opts)
            vim.keymap.set('n', '<leader>di', finders.diagnostics, m_opts)
            vim.keymap.set('n', '<leader>fb', finders.current_buffer_fuzzy_find, m_opts)
            vim.keymap.set('n', 'z=', finders.spell_suggest, m_opts)

            vim.keymap.set('n', 'gd', finders.lsp_definitions, m_opts)
            vim.keymap.set('n', 'gi', finders.lsp_implementations, m_opts)
            vim.keymap.set('n', 'go', finders.lsp_type_definitions, m_opts)
            vim.keymap.set('n', 'gr', finders.lsp_references, m_opts)
            vim.keymap.set('n', 'gW', finders.lsp_workspace_symbols, m_opts)
        end
    }

    use {
        'ThePrimeagen/harpoon',
        config = function()
            local harpoon = require('harpoon')
            local ui = require('harpoon.ui')
            local mark = require('harpoon.mark')
            local term = require('harpoon.term')

            harpoon.setup({
                projects = {
                    ['~/onboarding/fury_rampup-wuilliam-lacruz'] = {
                        term = {
                            cmds = {
                                'go test ./...\n',
                                'fury run 21001\n',
                            }
                        },
                    },
                    ['~/work/fury_bari-transaction-channel'] = {
                        term = {
                            cmds = {
                                'make test\n',
                                'make run\n',
                            }
                        },
                    },
                    ['~/work/fury_bari-transactor'] = {
                        term = {
                            cmds = {
                                'make test\n',
                                'make run\n',
                            }
                        },
                    }
                },
            })

            vim.keymap.set('n', '<leader>mb', function() mark.add_file() end, m_opts)
            vim.keymap.set('n', '<leader>mu', function() ui.nav_file(1) end, m_opts)
            vim.keymap.set('n', '<leader>me', function() ui.nav_file(2) end, m_opts)
            vim.keymap.set('n', '<leader>mo', function() ui.nav_file(3) end, m_opts)
            vim.keymap.set('n', '<leader>ma', function() ui.nav_file(4) end, m_opts)
            vim.keymap.set('n', '<leader>mm', function() ui.toggle_quick_menu() end, m_opts)
            vim.keymap.set('n', '<leader>tu', function() term.gotoTerminal(1) end, m_opts)
            vim.keymap.set('n', '<leader>te', function() term.gotoTerminal(2) end, m_opts)
            vim.keymap.set('n', '<leader>to', function() term.gotoTerminal(3) end, m_opts)
            vim.keymap.set('n', '<leader>ta', function() term.gotoTerminal(4) end, m_opts)
        end
    }

    -- version control
    use {
        'airblade/vim-gitgutter',
        config = function()
            vim.keymap.set('n', '<leader>ghp', '@<Plug>(GitGutterPreviewHunk)', m_opts)
            vim.keymap.set('n', '<leader>ghu', '@<Plug>(GitGutterUndoHunk)', m_opts)
            vim.keymap.set('n', '<leader>ghs', '@<Plug>(GitGutterStageHunk)', m_opts)
            vim.keymap.set('x', '<leader>ghs', '@<Plug>(GitGutterStageHunk)', m_opts)
        end,
    }

    use {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.G, m_opts)
        end,
    }

    -- code style
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        requires = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/nvim-treesitter-context' },
        },
        config = function()
            local treesitter = require('nvim-treesitter.configs')
            local context = require('treesitter-context')
            local enable = true

            treesitter.setup({
                ensure_installed = {
                    'go',
                    'javascript',
                    'typescript',
                    'python',
                    'bash',
                    'lua',
                    'json',
                    'yaml',
                    -- 'tsx',
                    -- 'hcl',
                    -- 'vue',
                    -- 'css',
                    -- 'html',
                },
                highlight = {
                    enable = enable,
                    -- disable = { "kotlin" },
                },
                incremental_selection = {
                    enable = enable,
                    keymaps = {
                        -- mappings for incremental selection (visual mappings)
                        init_selection = 'gnn',    -- maps in normal mode to init the node/scope selection
                        node_incremental = 'grn',  -- increment to the upper named parent
                        scope_incremental = 'grc', -- increment to the upper scope (as defined in locals.scm)
                        node_decremental = 'grm',  -- decrement to the previous node
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
                        goto_next_start = { [']m'] = '@function.outer' },
                        goto_next_end = { [']M'] = '@function.outer' },
                        goto_previous_start = { ['[m'] = '@function.outer' },
                        goto_previous_end = { ['[M'] = '@function.outer' },
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
                        swap_next = { [']p'] = '@parameter.inner' },
                        swap_previous = { ['[p'] = '@parameter.inner' },
                    },
                },
            })

            context.setup {
                enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
            }
        end
    }

    -- colorschemes
    -- use {
    --     'gruvbox-community/gruvbox',
    --     config = function()
    --         vim.opt.termguicolors = true

    --         vim.opt.background = 'dark'
    --         vim.g.gruvbox_contrast_dark = "hard"
    --         vim.g.gruvbox_italic = '1'
    --         vim.g.gruvbox_invert_selection = '1'

    --         vim.cmd([[ highlight ColorColumn ctermbg=0 guibg=lightgrey ]])
    --         vim.cmd([[ colorscheme gruvbox ]])

    --         vim.keymap.set('n', '*', ':let @/ = ""<CR>:call gruvbox#hls_show()<CR>*', m_opts)
    --         vim.keymap.set('n', '/', ':let @/ = ""<CR>:call gruvbox#hls_show()<CR>/', m_opts)
    --         vim.keymap.set('n', '?', ':let @/ = ""<CR>:call gruvbox#hls_show()<CR>?', m_opts)
    --     end
    -- }

    use {
        "catppuccin/nvim", as = "catppuccin",
        config = function()
            local catppuccin = require("catppuccin")
            catppuccin.setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                custom_highlights = function(colors)
                    return {
                        ColorColumn = { bg = colors.surface0 },
                        CursorLine = { bg = colors.surface0 },
                        CursorColumn = { bg = colors.surface0 },
                    }
                end,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    gitgutter = true,
                    harpoon = true,
                    telescope = true,
                    treesitter_context = true,
                },
            })

            vim.opt.termguicolors = true
            vim.cmd.colorscheme "catppuccin"
        end
    }


    -- debugging
    use {
        'puremourning/vimspector',
        requires = {
            { 'tyru/current-func-info.vim' }
        },
        config = function()
            vim.keymap.set('n', '<leader>da', '<cmd>call vimspector#LaunchWithSettings( #{ configuration: "app" } )<cr>',
                m_opts)
            vim.keymap.set('n', '<leader>df', '<cmd>call vimspector#LaunchWithSettings( #{ configuration: "file" } )<cr>',
                m_opts)
            vim.keymap.set('n', '<leader>ds', '<cmd>VimspectorReset<cr>', m_opts)
            vim.keymap.set('n', '<leader>bp', '<cmd>call vimspector#ToggleBreakpoint()<cr>', m_opts)
            vim.keymap.set('n', '<leader>dn', '<cmd>call vimspector#StepOver()<cr>', m_opts)
            vim.keymap.set('n', '<leader>dc', '<cmd>call vimspector#Continue()<cr>', m_opts)

            -- uses tyru/current-func-info.vim
            vim.keymap.set('n', '<leader>dm',
                '<cmd>call vimspector#LaunchWithSettings( #{ configuration: "method", Test: "^" . cfi#format("%s", "") . "$" } )<cr>',
                m_opts)
        end
    }

    -- utils
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-commentary' }

    use {
        'mbbill/undotree',
        config = function()
            vim.opt.backup = false
            vim.opt.swapfile = false
            vim.opt.writebackup = false
            vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
            vim.opt.undofile = true

            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, m_opts)
        end
    }

    use {
        'folke/todo-comments.nvim',
        config = function()
            require('todo-comments').setup({})
        end
    }

    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' }
        },
        config = function()
            local refactoring = require('refactoring')
            refactoring.setup({})

            vim.keymap.set('v', '<leader>rr', refactoring.select_refactor, m_opts)

            -- local telescope = require('telescope')
            -- vim.keymap.set('v', '<leader>rr', telescope.extensions.refactoring.refactors, mapping_opts)
        end
    }


    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'diff', 'diagnostics' }, -- 'branch',
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { 'fugitive' },
            })
        end
    }

    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup({ default = true })
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)