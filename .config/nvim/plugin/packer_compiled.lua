-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/wlacruz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/wlacruz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/wlacruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/wlacruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/wlacruz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\n{\0\1\4\0\t\0\0145\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\5\0009\3\0\0=\3\2\2=\2\6\0015\2\a\0009\3\0\0=\3\2\2=\2\b\1L\1\2\0\17CursorColumn\1\0\0\15CursorLine\1\0\0\16ColorColumn\1\0\0\abg\1\0\0\rsurface0™\2\1\0\5\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0003\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\0016\1\b\0009\1\t\1+\2\2\0=\2\n\0016\1\b\0009\1\v\0019\1\f\1'\3\1\0B\1\2\1K\0\1\0\16colorscheme\bcmd\18termguicolors\bopt\bvim\17integrations\1\0\a\14telescope\2\fharpoon\2\23treesitter_context\2\15treesitter\2\14gitgutter\2\rgitsigns\2\bcmp\2\22custom_highlights\0\1\0\1\fflavour\vfrappe\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["current-func-info.vim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/current-func-info.vim",
    url = "https://github.com/tyru/current-func-info.vim"
  },
  harpoon = {
    config = { "\27LJ\2\n\"\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\2À\radd_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\1À\rnav_file+\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\22toggle_quick_menu*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\3À\17gotoTerminal‹\a\1\0\v\1/\0u6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\21\0005\a\v\0005\b\t\0005\t\a\0005\n\6\0=\n\b\t=\t\n\b=\b\f\a5\b\15\0005\t\14\0005\n\r\0=\n\b\t=\t\n\b=\b\16\a5\b\19\0005\t\18\0005\n\17\0=\n\b\t=\t\n\b=\b\20\a=\a\22\6B\4\2\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\27\0003\b\28\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\29\0003\b\30\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\31\0003\b \0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a!\0003\b\"\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a#\0003\b$\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a%\0003\b&\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a'\0003\b(\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a)\0003\b*\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a+\0003\b,\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a-\0003\b.\0-\t\0\0B\4\5\0012\0\0€K\0\1\0\0\0\0\15<leader>ta\0\15<leader>to\0\15<leader>te\0\15<leader>tu\0\15<leader>mm\0\15<leader>ma\0\15<leader>mo\0\15<leader>me\0\15<leader>mu\0\15<leader>mb\6n\bset\vkeymap\bvim\rprojects\1\0\0 ~/work/fury_bari-transactor\1\0\0\1\0\0\1\3\0\0\15make test\n\14make run\n)~/work/fury_bari-transaction-channel\1\0\0\1\0\0\1\3\0\0\15make test\n\14make run\n-~/onboarding/fury_rampup-wuilliam-lacruz\1\0\0\tterm\1\0\0\tcmds\1\0\0\1\3\0\0\19go test ./...\n\20fury run 21001\n\nsetup\17harpoon.term\17harpoon.mark\15harpoon.ui\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    config = { "\27LJ\2\n—\n\0\2\b\2\27\0Z-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\0016\2\3\0009\2\4\2'\4\5\0B\2\2\0016\2\3\0009\2\4\2'\4\6\0B\2\2\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\3\0009\6\v\0069\6\f\0069\6\r\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\14\0006\6\3\0009\6\v\0069\6\f\0069\6\r\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\3\0009\6\v\0069\6\f\0069\6\16\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\3\0009\6\v\0069\6\f\0069\6\18\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0'\6\20\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0'\6\22\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0'\6\24\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0'\6\26\0-\a\1\0B\2\5\1K\0\1\0\0À\0\0.<cmd>lua vim.diagnostic.goto_next()<cr>zz\a]d.<cmd>lua vim.diagnostic.goto_prev()<cr>zz\a[d\21<cmd>cnext<cr>zz\n<C-l>\21<cmd>cprev<cr>zz\n<C-h>\16code_action\15<leader>ca\vrename\15<leader>rn\15<leader>pd\vformat\bbuf\blsp\15<leader>fd\6n\bset\vkeymapà\2                    augroup lsp_document_codelens\n                        au! * <buffer>\n                        autocmd BufEnter ++once         <buffer> lua require\"vim.lsp.codelens\".refresh()\n                        autocmd BufWritePost,CursorHold <buffer> lua require\"vim.lsp.codelens\".refresh()\n                    augroup END\n                Å\2                    augroup lsp_document_highlight\n                        autocmd! * <buffer>\n                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n                    augroup END\n                \bcmd\bvim\vbuffer\1\0\0\20default_keymapsC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\4\0\2\n\0\23\0?5\2\0\0006\3\1\0'\5\2\0B\3\2\2\14\0\3\0X\4\1€K\0\1\0009\4\4\0039\6\3\0015\a\5\0B\4\3\2=\4\3\0019\4\a\0009\4\b\0048\4\4\2=\4\6\0019\4\a\0009\4\b\4\a\4\t\0X\4\"€9\4\n\0009\4\v\4\14\0\4\0X\5\1€4\4\0\0009\4\f\4'\5\r\0=\5\3\1\15\0\4\0X\5\v€\18\a\4\0009\5\14\4'\b\15\0B\5\3\2\15\0\5\0X\6\5€9\5\3\1'\6\16\0\18\a\4\0&\5\a\5=\5\3\0019\5\n\0009\5\17\5\14\0\5\0X\6\1€4\5\0\0009\5\18\5\15\0\5\0X\6\5€9\5\3\1'\6\16\0'\a\19\0&\5\a\5=\5\3\1)\0042\0006\5\21\0009\5\22\0059\a\20\1)\b\1\0\18\t\4\0B\5\4\2=\5\20\1L\1\2\0\bsub\vstring\tabbr\t[ML]\14multiline\tdata\6 \v.*%%.*\tfind\bïƒ§\vdetail\17labelDetails\20completion_item\16cmp_tabnine\tname\vsource\tmenu\1\0\2\18ellipsis_char\b...\tmode\vsymbol\rsymbolic\tkind\flspkind\frequire\1\0\6\fluasnip\14[Snippet]\vbuffer\r[Buffer]\tpath\v[Path]\rnvim_lua\n[Lua]\16cmp_tabnine\t[TN]\rnvim_lsp\n[LSP]a\0\1\6\0\5\0\f6\1\0\0006\3\1\0009\3\2\0039\3\3\3\18\4\0\0'\5\4\0B\1\4\3\14\0\1\0X\3\2€+\3\2\0L\3\2\0L\2\2\0\15show_signs\21nvim_buf_get_var\bapi\bvim\npcallÿ\b\1\0\n\1E\0m6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0029\1\3\0003\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\0019\1\a\0'\3\b\0005\4\16\0005\5\14\0005\6\f\0005\a\n\0005\b\t\0=\b\v\a=\a\r\6=\6\15\5=\5\17\4B\1\3\0019\1\a\0'\3\18\0005\4\25\0005\5\24\0005\6\20\0005\a\19\0=\a\21\0065\a\22\0=\a\23\6=\6\18\5=\5\17\4B\1\3\0019\1\26\0B\1\1\0016\1\0\0'\3\27\0B\1\2\0026\2\0\0'\4\1\0B\2\2\0029\2\28\2B\2\1\0029\3\26\0015\5 \0005\6\30\0003\a\29\0=\a\31\6=\6!\0054\6\6\0005\a\"\0>\a\1\0065\a#\0>\a\2\0065\a$\0>\a\3\0065\a%\0>\a\4\0065\a&\0>\a\5\6=\6'\0055\6)\0009\a(\2B\a\1\2=\a*\0069\a+\2B\a\1\2=\a,\0069\a-\0019\a.\aB\a\1\2=\a/\0069\a-\0019\a0\aB\a\1\2=\a1\0069\a-\0019\a2\a5\t3\0B\a\2\2=\a4\6=\6-\0055\0066\0003\a5\0=\a7\6=\0068\5B\3\2\0016\0039\0009\3:\0039\3;\0036\0049\0009\4:\0049\4=\0046\0069\0009\6:\0069\6>\0069\6?\0065\aA\0005\b@\0=\bB\a3\bC\0=\bD\aB\4\3\2=\4<\0032\0\0€K\0\1\0\0\0\nsigns\0\17virtual_text\1\0\0\1\0\2\fspacing\3\4\vprefix\6~\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\15formatting\vformat\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\fmapping\n<C-b>\26luasnip_jump_backward\n<C-f>\1\0\0\25luasnip_jump_forward\fsources\1\0\1\tname\16cmp_tabnine\1\0\2\tname\fluasnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\3\1\0\1\tname\rnvim_lsp\1\0\1\tname\tpath\fsnippet\1\0\0\vexpand\1\0\0\0\15cmp_action\bcmp\nsetup\1\0\0\1\0\0\15buildFlags\1\2\0\0\22-tags=integration\15codelenses\1\0\1\20usePlaceholders\2\1\0\1\15gc_details\1\ngopls\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\vlua_ls\buse\1\6\0\0\vlua_ls\ngopls\21golangci_lint_ls\rtsserver\18rust_analyzer\21ensure_installed\0\14on_attach\vpreset\rlsp-zero\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nŠ\5\0\0\6\0 \00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\3\0\0\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nâ\t\0\0\t\0(\00076\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2+\2\2\0009\3\3\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\2\b\6=\6\t\0055\6\n\0=\2\b\0065\a\v\0=\a\f\6=\6\r\0055\6\14\0=\2\b\0065\a\15\0=\2\b\a5\b\16\0=\b\17\a=\a\18\0065\a\19\0=\2\b\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a5\b\24\0=\b\25\a5\b\26\0=\b\27\a=\a\28\0065\a\29\0=\2\b\a5\b\30\0=\b\f\a=\a\31\0065\a \0=\2\b\a5\b!\0=\b\"\a5\b#\0=\b$\a=\a%\6=\6&\5B\3\2\0019\3\3\0015\5'\0B\3\2\1K\0\1\0\1\0\b\14max_lines\3\0\venable\2\vzindex\3\20\tmode\vcursor\15trim_scope\nouter\24multiline_threshold\3\20\17line_numbers\2\22min_window_height\3\0\16textobjects\tswap\18swap_previous\1\0\1\a[p\21@parameter.inner\14swap_next\1\0\1\a]p\21@parameter.inner\1\0\0\vselect\1\0\15\aim\16@call.inner\aii\23@conditional.inner\aam\16@call.outer\aai\23@conditional.outer\aad\19@comment.outer\aiC\17@class.inner\aaC\17@class.outer\aas\21@statement.outer\aaf\20@function.outer\ail\16@loop.inner\ais\21@statement.inner\aal\16@loop.outer\aif\20@function.inner\aie\17@block.inner\aae\17@block.outer\1\0\0\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\1\14set_jumps\2\16lsp_interop\25peek_definition_code\1\0\2\15<leader>cF\17@class.outer\15<leader>dF\20@function.outer\1\0\0\1\0\0\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\0\14highlight\venable\1\0\0\21ensure_installed\1\0\0\1\t\0\0\ago\15javascript\15typescript\vpython\tbash\blua\tjson\tyaml\nsetup\23treesitter-context\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n‹\1\0\0\a\1\t\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0-\6\0\0B\1\5\1K\0\1\0\0\0\20select_refactor\15<leader>rr\6v\bset\vkeymap\bvim\nsetup\16refactoring\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nû\a\0\0\n\0011\0‡\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\v\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\5=\5\f\0045\5\15\0004\6\3\0006\a\0\0'\t\r\0B\a\2\0029\a\14\a>\a\1\6=\6\16\5=\5\17\4B\2\2\0019\2\18\0'\4\19\0B\2\2\0019\2\18\0'\4\16\0B\2\2\0019\2\18\0'\4\20\0B\2\2\0016\2\0\0'\4\r\0B\2\2\0026\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\25\0009\a\26\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\27\0009\a\28\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\29\0009\a\30\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\31\0009\a \2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6!\0009\a\"\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6#\0009\a$\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6%\0009\a&\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6'\0009\a(\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6)\0009\a*\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6+\0009\a,\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6-\0009\a.\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6/\0009\a0\2-\b\0\0B\3\5\1K\0\1\0\0\0\26lsp_workspace_symbols\agW\19lsp_references\agr\25lsp_type_definitions\ago\24lsp_implementations\agi\20lsp_definitions\agd\18spell_suggest\az=\30current_buffer_fuzzy_find\15<leader>fb\16diagnostics\15<leader>di\16grep_string\15<leader>pg\fbuffers\15<leader>pb\15find_files\15<leader>pf\14git_files\15<leader>pp\6n\bset\vkeymap\bvim\bfzf\16refactoring\19load_extension\15extensions\14ui-select\1\0\0\15no_preview\24wuilliam321.finders\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-q>\1\0\0\19send_to_qflist\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n•\2\0\0\6\1\17\0$6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0006\1\6\0009\1\a\1'\3\b\0B\1\2\2'\2\t\0&\1\2\1=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\0\0009\4\15\0049\4\16\4-\5\0\0B\0\5\1K\0\1\0\0\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\rundofile\18/.vim/undodir\tHOME\vgetenv\aos\fundodir\16writebackup\rswapfile\vbackup\bopt\bvim\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nW\0\0\6\1\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4-\5\0\0B\0\5\1K\0\1\0\0\0\6G\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\n™\2\0\0\6\1\v\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\b\0'\4\t\0-\5\0\0B\0\5\1K\0\1\0\0\0\6x @<Plug>(GitGutterStageHunk)\16<leader>ghs\31@<Plug>(GitGutterUndoHunk)\16<leader>ghu\"@<Plug>(GitGutterPreviewHunk)\16<leader>ghp\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimspector = {
    config = { "\27LJ\2\nß\5\0\0\6\1\18\00096\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0'\4\r\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\14\0'\4\15\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0-\5\0\0B\0\5\1K\0\1\0\0\0x<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"method\", Test: \"^\" . cfi#format(\"%s\", \"\") . \"$\" } )<cr>\15<leader>dm(<cmd>call vimspector#Continue()<cr>\15<leader>dc(<cmd>call vimspector#StepOver()<cr>\15<leader>dn0<cmd>call vimspector#ToggleBreakpoint()<cr>\15<leader>bp\29<cmd>VimspectorReset<cr>\15<leader>dsN<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"file\" } )<cr>\15<leader>dfM<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"app\" } )<cr>\15<leader>da\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/wlacruz/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nŠ\5\0\0\6\0 \00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\3\0\0\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n{\0\1\4\0\t\0\0145\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\5\0009\3\0\0=\3\2\2=\2\6\0015\2\a\0009\3\0\0=\3\2\2=\2\b\1L\1\2\0\17CursorColumn\1\0\0\15CursorLine\1\0\0\16ColorColumn\1\0\0\abg\1\0\0\rsurface0™\2\1\0\5\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0003\4\4\0=\4\5\0035\4\6\0=\4\a\3B\1\2\0016\1\b\0009\1\t\1+\2\2\0=\2\n\0016\1\b\0009\1\v\0019\1\f\1'\3\1\0B\1\2\1K\0\1\0\16colorscheme\bcmd\18termguicolors\bopt\bvim\17integrations\1\0\a\14telescope\2\fharpoon\2\23treesitter_context\2\15treesitter\2\14gitgutter\2\rgitsigns\2\bcmp\2\22custom_highlights\0\1\0\1\fflavour\vfrappe\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n‹\1\0\0\a\1\t\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0-\6\0\0B\1\5\1K\0\1\0\0\0\20select_refactor\15<leader>rr\6v\bset\vkeymap\bvim\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n•\2\0\0\6\1\17\0$6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0006\1\6\0009\1\a\1'\3\b\0B\1\2\2'\2\t\0&\1\2\1=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\0\0009\4\15\0049\4\16\4-\5\0\0B\0\5\1K\0\1\0\0\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\rundofile\18/.vim/undodir\tHOME\vgetenv\aos\fundodir\16writebackup\rswapfile\vbackup\bopt\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nû\a\0\0\n\0011\0‡\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\v\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\5=\5\f\0045\5\15\0004\6\3\0006\a\0\0'\t\r\0B\a\2\0029\a\14\a>\a\1\6=\6\16\5=\5\17\4B\2\2\0019\2\18\0'\4\19\0B\2\2\0019\2\18\0'\4\16\0B\2\2\0019\2\18\0'\4\20\0B\2\2\0016\2\0\0'\4\r\0B\2\2\0026\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\25\0009\a\26\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\27\0009\a\28\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\29\0009\a\30\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6\31\0009\a \2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6!\0009\a\"\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6#\0009\a$\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6%\0009\a&\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6'\0009\a(\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6)\0009\a*\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6+\0009\a,\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6-\0009\a.\2-\b\0\0B\3\5\0016\3\21\0009\3\22\0039\3\23\3'\5\24\0'\6/\0009\a0\2-\b\0\0B\3\5\1K\0\1\0\0\0\26lsp_workspace_symbols\agW\19lsp_references\agr\25lsp_type_definitions\ago\24lsp_implementations\agi\20lsp_definitions\agd\18spell_suggest\az=\30current_buffer_fuzzy_find\15<leader>fb\16diagnostics\15<leader>di\16grep_string\15<leader>pg\fbuffers\15<leader>pb\15find_files\15<leader>pf\14git_files\15<leader>pp\6n\bset\vkeymap\bvim\bfzf\16refactoring\19load_extension\15extensions\14ui-select\1\0\0\15no_preview\24wuilliam321.finders\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-q>\1\0\0\19send_to_qflist\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vimspector
time([[Config for vimspector]], true)
try_loadstring("\27LJ\2\nß\5\0\0\6\1\18\00096\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\f\0'\4\r\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\14\0'\4\15\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0-\5\0\0B\0\5\1K\0\1\0\0\0x<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"method\", Test: \"^\" . cfi#format(\"%s\", \"\") . \"$\" } )<cr>\15<leader>dm(<cmd>call vimspector#Continue()<cr>\15<leader>dc(<cmd>call vimspector#StepOver()<cr>\15<leader>dn0<cmd>call vimspector#ToggleBreakpoint()<cr>\15<leader>bp\29<cmd>VimspectorReset<cr>\15<leader>dsN<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"file\" } )<cr>\15<leader>dfM<cmd>call vimspector#LaunchWithSettings( #{ configuration: \"app\" } )<cr>\15<leader>da\6n\bset\vkeymap\bvim\0", "config", "vimspector")
time([[Config for vimspector]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
try_loadstring("\27LJ\2\n—\n\0\2\b\2\27\0Z-\2\0\0009\2\0\0025\4\1\0=\1\2\4B\2\2\0016\2\3\0009\2\4\2'\4\5\0B\2\2\0016\2\3\0009\2\4\2'\4\6\0B\2\2\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0006\6\3\0009\6\v\0069\6\f\0069\6\r\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\14\0006\6\3\0009\6\v\0069\6\f\0069\6\r\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\15\0006\6\3\0009\6\v\0069\6\f\0069\6\16\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\17\0006\6\3\0009\6\v\0069\6\f\0069\6\18\6-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\19\0'\6\20\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\21\0'\6\22\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\23\0'\6\24\0-\a\1\0B\2\5\0016\2\3\0009\2\a\0029\2\b\2'\4\t\0'\5\25\0'\6\26\0-\a\1\0B\2\5\1K\0\1\0\0À\0\0.<cmd>lua vim.diagnostic.goto_next()<cr>zz\a]d.<cmd>lua vim.diagnostic.goto_prev()<cr>zz\a[d\21<cmd>cnext<cr>zz\n<C-l>\21<cmd>cprev<cr>zz\n<C-h>\16code_action\15<leader>ca\vrename\15<leader>rn\15<leader>pd\vformat\bbuf\blsp\15<leader>fd\6n\bset\vkeymapà\2                    augroup lsp_document_codelens\n                        au! * <buffer>\n                        autocmd BufEnter ++once         <buffer> lua require\"vim.lsp.codelens\".refresh()\n                        autocmd BufWritePost,CursorHold <buffer> lua require\"vim.lsp.codelens\".refresh()\n                    augroup END\n                Å\2                    augroup lsp_document_highlight\n                        autocmd! * <buffer>\n                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n                    augroup END\n                \bcmd\bvim\vbuffer\1\0\0\20default_keymapsC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\4\0\2\n\0\23\0?5\2\0\0006\3\1\0'\5\2\0B\3\2\2\14\0\3\0X\4\1€K\0\1\0009\4\4\0039\6\3\0015\a\5\0B\4\3\2=\4\3\0019\4\a\0009\4\b\0048\4\4\2=\4\6\0019\4\a\0009\4\b\4\a\4\t\0X\4\"€9\4\n\0009\4\v\4\14\0\4\0X\5\1€4\4\0\0009\4\f\4'\5\r\0=\5\3\1\15\0\4\0X\5\v€\18\a\4\0009\5\14\4'\b\15\0B\5\3\2\15\0\5\0X\6\5€9\5\3\1'\6\16\0\18\a\4\0&\5\a\5=\5\3\0019\5\n\0009\5\17\5\14\0\5\0X\6\1€4\5\0\0009\5\18\5\15\0\5\0X\6\5€9\5\3\1'\6\16\0'\a\19\0&\5\a\5=\5\3\1)\0042\0006\5\21\0009\5\22\0059\a\20\1)\b\1\0\18\t\4\0B\5\4\2=\5\20\1L\1\2\0\bsub\vstring\tabbr\t[ML]\14multiline\tdata\6 \v.*%%.*\tfind\bïƒ§\vdetail\17labelDetails\20completion_item\16cmp_tabnine\tname\vsource\tmenu\1\0\2\18ellipsis_char\b...\tmode\vsymbol\rsymbolic\tkind\flspkind\frequire\1\0\6\fluasnip\14[Snippet]\vbuffer\r[Buffer]\tpath\v[Path]\rnvim_lua\n[Lua]\16cmp_tabnine\t[TN]\rnvim_lsp\n[LSP]a\0\1\6\0\5\0\f6\1\0\0006\3\1\0009\3\2\0039\3\3\3\18\4\0\0'\5\4\0B\1\4\3\14\0\1\0X\3\2€+\3\2\0L\3\2\0L\2\2\0\15show_signs\21nvim_buf_get_var\bapi\bvim\npcallÿ\b\1\0\n\1E\0m6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0029\1\3\0003\3\4\0B\1\2\0019\1\5\0005\3\6\0B\1\2\0019\1\a\0'\3\b\0005\4\16\0005\5\14\0005\6\f\0005\a\n\0005\b\t\0=\b\v\a=\a\r\6=\6\15\5=\5\17\4B\1\3\0019\1\a\0'\3\18\0005\4\25\0005\5\24\0005\6\20\0005\a\19\0=\a\21\0065\a\22\0=\a\23\6=\6\18\5=\5\17\4B\1\3\0019\1\26\0B\1\1\0016\1\0\0'\3\27\0B\1\2\0026\2\0\0'\4\1\0B\2\2\0029\2\28\2B\2\1\0029\3\26\0015\5 \0005\6\30\0003\a\29\0=\a\31\6=\6!\0054\6\6\0005\a\"\0>\a\1\0065\a#\0>\a\2\0065\a$\0>\a\3\0065\a%\0>\a\4\0065\a&\0>\a\5\6=\6'\0055\6)\0009\a(\2B\a\1\2=\a*\0069\a+\2B\a\1\2=\a,\0069\a-\0019\a.\aB\a\1\2=\a/\0069\a-\0019\a0\aB\a\1\2=\a1\0069\a-\0019\a2\a5\t3\0B\a\2\2=\a4\6=\6-\0055\0066\0003\a5\0=\a7\6=\0068\5B\3\2\0016\0039\0009\3:\0039\3;\0036\0049\0009\4:\0049\4=\0046\0069\0009\6:\0069\6>\0069\6?\0065\aA\0005\b@\0=\bB\a3\bC\0=\bD\aB\4\3\2=\4<\0032\0\0€K\0\1\0\0\0\nsigns\0\17virtual_text\1\0\0\1\0\2\fspacing\3\4\vprefix\6~\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\15formatting\vformat\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\fmapping\n<C-b>\26luasnip_jump_backward\n<C-f>\1\0\0\25luasnip_jump_forward\fsources\1\0\1\tname\16cmp_tabnine\1\0\2\tname\fluasnip\19keyword_length\3\2\1\0\2\tname\vbuffer\19keyword_length\3\3\1\0\1\tname\rnvim_lsp\1\0\1\tname\tpath\fsnippet\1\0\0\vexpand\1\0\0\0\15cmp_action\bcmp\nsetup\1\0\0\1\0\0\15buildFlags\1\2\0\0\22-tags=integration\15codelenses\1\0\1\20usePlaceholders\2\1\0\1\15gc_details\1\ngopls\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\vlua_ls\buse\1\6\0\0\vlua_ls\ngopls\21golangci_lint_ls\rtsserver\18rust_analyzer\21ensure_installed\0\14on_attach\vpreset\rlsp-zero\frequire\0", "config", "lsp-zero.nvim")
time([[Config for lsp-zero.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nW\0\0\6\1\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4-\5\0\0B\0\5\1K\0\1\0\0\0\6G\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nâ\t\0\0\t\0(\00076\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2+\2\2\0009\3\3\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\2\b\6=\6\t\0055\6\n\0=\2\b\0065\a\v\0=\a\f\6=\6\r\0055\6\14\0=\2\b\0065\a\15\0=\2\b\a5\b\16\0=\b\17\a=\a\18\0065\a\19\0=\2\b\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a5\b\24\0=\b\25\a5\b\26\0=\b\27\a=\a\28\0065\a\29\0=\2\b\a5\b\30\0=\b\f\a=\a\31\0065\a \0=\2\b\a5\b!\0=\b\"\a5\b#\0=\b$\a=\a%\6=\6&\5B\3\2\0019\3\3\0015\5'\0B\3\2\1K\0\1\0\1\0\b\14max_lines\3\0\venable\2\vzindex\3\20\tmode\vcursor\15trim_scope\nouter\24multiline_threshold\3\20\17line_numbers\2\22min_window_height\3\0\16textobjects\tswap\18swap_previous\1\0\1\a[p\21@parameter.inner\14swap_next\1\0\1\a]p\21@parameter.inner\1\0\0\vselect\1\0\15\aim\16@call.inner\aii\23@conditional.inner\aam\16@call.outer\aai\23@conditional.outer\aad\19@comment.outer\aiC\17@class.inner\aaC\17@class.outer\aas\21@statement.outer\aaf\20@function.outer\ail\16@loop.inner\ais\21@statement.inner\aal\16@loop.outer\aif\20@function.inner\aie\17@block.inner\aae\17@block.outer\1\0\0\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\1\14set_jumps\2\16lsp_interop\25peek_definition_code\1\0\2\15<leader>cF\17@class.outer\15<leader>dF\20@function.outer\1\0\0\1\0\0\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\0\14highlight\venable\1\0\0\21ensure_installed\1\0\0\1\t\0\0\ago\15javascript\15typescript\vpython\tbash\blua\tjson\tyaml\nsetup\23treesitter-context\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n\"\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\2À\radd_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\1À\rnav_file&\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\1À\rnav_file+\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1À\22toggle_quick_menu*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\1\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\2\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\3\0B\0\2\1K\0\1\0\3À\17gotoTerminal*\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2\4\0B\0\2\1K\0\1\0\3À\17gotoTerminal‹\a\1\0\v\1/\0u6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\21\0005\a\v\0005\b\t\0005\t\a\0005\n\6\0=\n\b\t=\t\n\b=\b\f\a5\b\15\0005\t\14\0005\n\r\0=\n\b\t=\t\n\b=\b\16\a5\b\19\0005\t\18\0005\n\17\0=\n\b\t=\t\n\b=\b\20\a=\a\22\6B\4\2\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\27\0003\b\28\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\29\0003\b\30\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a\31\0003\b \0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a!\0003\b\"\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a#\0003\b$\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a%\0003\b&\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a'\0003\b(\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a)\0003\b*\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a+\0003\b,\0-\t\0\0B\4\5\0016\4\23\0009\4\24\0049\4\25\4'\6\26\0'\a-\0003\b.\0-\t\0\0B\4\5\0012\0\0€K\0\1\0\0\0\0\15<leader>ta\0\15<leader>to\0\15<leader>te\0\15<leader>tu\0\15<leader>mm\0\15<leader>ma\0\15<leader>mo\0\15<leader>me\0\15<leader>mu\0\15<leader>mb\6n\bset\vkeymap\bvim\rprojects\1\0\0 ~/work/fury_bari-transactor\1\0\0\1\0\0\1\3\0\0\15make test\n\14make run\n)~/work/fury_bari-transaction-channel\1\0\0\1\0\0\1\3\0\0\15make test\n\14make run\n-~/onboarding/fury_rampup-wuilliam-lacruz\1\0\0\tterm\1\0\0\tcmds\1\0\0\1\3\0\0\19go test ./...\n\20fury run 21001\n\nsetup\17harpoon.term\17harpoon.mark\15harpoon.ui\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\n™\2\0\0\6\1\v\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0-\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\b\0'\4\t\0-\5\0\0B\0\5\1K\0\1\0\0\0\6x @<Plug>(GitGutterStageHunk)\16<leader>ghs\31@<Plug>(GitGutterUndoHunk)\16<leader>ghu\"@<Plug>(GitGutterPreviewHunk)\16<leader>ghp\6n\bset\vkeymap\bvim\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
