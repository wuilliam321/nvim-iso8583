local config = require("iso8583.config")

local available_encodings = {
    ["1"] = "ebcdic",
    ["2"] = "bcd",
    ["3"] = "ascii",
}

local prompt = {
    "Select a parser",
}

for k, v in pairs(available_encodings) do
    table.insert(prompt, k .. ". " .. v)
end

local handle_output = function(_, data)
    if data then
        local cur_pos = vim.api.nvim_win_get_cursor(0)
        local row = cur_pos[1] - 1
        local col = cur_pos[2]
        local bufnr = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_text(bufnr, row, col, row, col, data)
    end
end

vim.api.nvim_create_user_command("Iso8583Encode", function()
    local selection = tostring(vim.fn.inputlist(prompt))
    local encoding = available_encodings[selection]
    local input = vim.fn.input("Text (" .. encoding .. ")> ")
    local cmd = { config.cmd, "parse", "-enc", encoding, input }
    vim.fn.jobstart(cmd, {
        stout_buffered = true,
        on_stdout = handle_output,
        on_stderr = handle_output,
    })
end, {})

-- TODO: eventually a Decode is possible
