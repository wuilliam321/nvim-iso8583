require("wuilliam321.settings")
require("wuilliam321.packer")
require("wuilliam321.mappings")
require("wuilliam321.finders")

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...) return require('plenary.reload').reload_module(...) end

R = function(name)
    RELOAD(name)
    return require(name)
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local wuilliam_group = augroup('Wuilliam321', {})
autocmd({ "BufWritePre" }, {
    group = wuilliam_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
