local M = {}

--[[
    setup the iso8583 plugin

    opts:
    - cmd: the path to the iso8583 binary
]]
M.setup = function(opts)
    opts = opts or {}

    require("iso8583.config").set_defaults(opts)
end


return M
