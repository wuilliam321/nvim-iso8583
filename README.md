# iso8583

## Requirements
 * [Neovim](https://neovim.io/) 0.9.0 or above
 * [iso8583](https://github.com/wuilliam321/go-iso8583-parser) 0.0.1 or more

## Install
You can use any nvim package manager, for example, using packer.nvim:

```lua
    ...
    use {
        'wuilliam321/nvim-iso8583',
        config = function()
            require('iso8583').setup({
                -- cmd = "iso8583",
            })
        end
    }
```

## Usage

You just need to run `:Iso8583Encode` and follow instructions
