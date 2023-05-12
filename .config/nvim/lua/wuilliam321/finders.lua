local themes = require('telescope.themes')
local builtin = require('telescope.builtin')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local conf = require('telescope.config').values
-- local action_set = require('telescope.actions.set')
-- local action_state = require('telescope.actions.state')
-- local actions = require('telescope.actions')


local custom_themes = {}
-- Dropdown list theme using a builtin theme definitions :
custom_themes.no_preview = themes.get_ivy({
    -- winblend = 10,
    prompt = ' > ',
    previewer = false,
    path_display = { truncate = 1 },
    -- layout_config = { width = 180 },
})

-- Settings for with preview option
custom_themes.with_preview = themes.get_ivy({
    -- winblend = 10,
    prompt = ' > ',
    results_title = false,
    path_display = { truncate = 1 },
    -- layout_config = { width = 120 },
})

local M = {}

M.no_preview = custom_themes.no_preview
M.with_preview = custom_themes.with_preview

-- navigation
M.git_files = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.prompt_title = 'Git Files (workspace)'
    builtin.git_files(opts)
end

M.find_files = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.prompt_title = 'Project Find (cwd)'
    opts.hidden = true
    builtin.find_files(opts)
end

M.buffers = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    builtin.buffers(opts)
end

M.grep_string = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.search = vim.fn.input('Grep For > ', '')
    if opts.search == '' then return end
    builtin.grep_string(opts)
end

M.diagnostics = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.layout_config = { width = 0.9 }
    opts.prompt_title = 'Diagnostics'
    builtin.diagnostics(opts)
end

M.current_buffer_fuzzy_find = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.prompt_title = 'Find in (' .. vim.fn.expand('%:t') .. ')'
    builtin.current_buffer_fuzzy_find(opts)
end

M.spell_suggest = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.prompt_title = 'Spell Suggest'
    builtin.spell_suggest(opts)
end


-- lsp
M.lsp_definitions = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    builtin.lsp_definitions(opts)
end


M.lsp_implementations = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    local params = vim.lsp.util.make_position_params()

    vim.lsp.buf_request(0, 'textDocument/implementation', params,
        function(err, result, ctx, config)
            if not result then return end

            local bufnr = ctx.bufnr
            local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
            local new_result

            -- In go code, I do not like to see any mocks for impls
            if ft == 'go' then
                new_result = vim.tbl_filter(function(v)
                    return not string.find(v.uri, 'mock')
                end, result)
            end

            if #new_result > 1 then
                local flattened_results = {}
                if result then vim.list_extend(flattened_results, result) end

                local offset_encoding = vim.lsp.get_client_by_id(ctx.client_id)
                    .offset_encoding
                local locations = vim.lsp.util.locations_to_items(flattened_results,
                    offset_encoding)
                pickers.new(opts, {
                    prompt_title = 'Implementations',
                    finder = finders.new_table {
                        results = locations,
                        entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts),
                    },
                    previewer = conf.qflist_previewer(opts),
                    sorter = conf.generic_sorter(opts),
                }):find()
            elseif #new_result == 1 then
                result = new_result
                vim.lsp.handlers['textDocument/implementation'](err, result, ctx, config)
                vim.cmd [[normal! zz]]
            end
        end)
end

M.lsp_type_definitions = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.prompt_title = 'Type Definitions'
    builtin.lsp_type_definitions(opts)
end

M.lsp_references = function()
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    local params = vim.lsp.util.make_position_params()
    params.context = { includeDeclaration = true }

    vim.lsp.buf_request(0, 'textDocument/references', params,
        function(err, result, ctx, config)
            if not result then return end

            -- without current line reference
            local filtered_results = {}
            filtered_results = vim.tbl_filter(function(v)
                local aux = v.range.start.line
                return lnum ~= aux + 1
                -- return true
            end, result)

            if vim.tbl_isempty(filtered_results) then return end

            if err then
                vim.api
                    .nvim_err_writeln('Error when finding references: ' .. err.message)
                return
            end

            local locations =
                vim.lsp.util.locations_to_items(filtered_results, vim.lsp
                    .get_client_by_id(ctx.client_id).offset_encoding)

            if #locations == 1 then
                vim.lsp.handlers['textDocument/references'](err, filtered_results, ctx,
                    config)
                vim.schedule(function()
                    vim.cmd [[cfirst]]
                    vim.cmd [[cclose]]
                    vim.cmd [[normal! zz]]
                end)
            else
                local opts = vim.deepcopy(custom_themes.with_preview)
                pickers.new(opts, {
                    prompt_title = 'LSP References',
                    finder = finders.new_table {
                        results = locations,
                        entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts),
                    },
                    previewer = conf.qflist_previewer(opts),
                    sorter = conf.generic_sorter(opts),
                }):find()
            end
        end)
end

M.lsp_workspace_symbols = function()
    local opts = vim.deepcopy(custom_themes.with_preview)
    opts.query = vim.fn.expand('<cword>')
    builtin.lsp_workspace_symbols(opts)
end

-- M.actions_golang = function()
--     local _opts = vim.deepcopy(custom_themes.no_preview)
--     local results = {
--         { cmd = 'GoFillStruct', name = 'Autofill struct' },
--         { cmd = 'GoAddTag',     name = 'Add struct tags' },
--         { cmd = 'GoRmTag',      name = 'Remove struct tags' },
--         { cmd = 'GoClearTag',   name = 'Clear struct tags' },
--         { cmd = 'GoImport',     name = 'Format file' },
--         { cmd = 'GoTest',       name = 'Run all tests' },
--         { cmd = 'GoTestPkg',    name = 'Run package tests' },
--         { cmd = 'GoTestFile',   name = 'Run file tests' },
--         { cmd = 'GoTestFunc',   name = 'Run current function tests' },
--     }
--     pickers.new(_opts, {
--         prompt_title = 'Go Actions',
--         finder = finders.new_table {
--             results = results,
--             entry_maker = function(entry)
--                 return {
--                     value = entry,
--                     display = entry.name .. ' (' .. entry.cmd .. ')',
--                     ordinal = entry.name,
--                     cmd = entry.cmd,
--                 }
--             end,
--         },
--         attach_mappings = function(prompt_bufnr)
--             action_set.select:replace(function()
--                 local entry = action_state.get_selected_entry()
--                 local command = entry.cmd
--                 actions.close(prompt_bufnr)
--                 vim.cmd([[silent! ]] .. command)
--             end)
--             return true
--         end,
--     }):find()
-- end


-- -- M.file_browser = function()
-- --     local opts = vim.deepcopy(custom_themes.with_preview)
-- --     opts.prompt_title = 'File Browser'
-- --     opts.path = '%:p:h'
-- --     opts.hidden = true
-- --     telescope.extensions.file_browser.file_browser(opts)
-- -- end

-- M.project_live_grep = function()
--     local opts = vim.deepcopy(custom_themes.with_preview)
--     builtin.live_grep(opts)
-- end

-- M.command_history = function()
--     local opts = vim.deepcopy(custom_themes.no_preview)
--     builtin.command_history(opts)
-- end

-- M.project_word = function()
--     local opts = vim.deepcopy(custom_themes.with_preview)
--     opts.search = vim.fn.expand('<cword>')
--     builtin.grep_string(opts)
-- end

-- M.quickfix = function()
--     local opts = vim.deepcopy(custom_themes.with_preview)
--     builtin.quickfix(opts)
-- end

-- M.help_tags = function()
--     local opts = vim.deepcopy(custom_themes.no_preview)
--     builtin.help_tags(opts)
-- end



return M
