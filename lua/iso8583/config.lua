local config = {}

config.set_defaults = function(opts)
    config.cmd = opts.cmd or "iso8583"
end

return config
