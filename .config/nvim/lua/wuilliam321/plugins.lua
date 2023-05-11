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

return require("packer").startup(function(use)
    -- use('~/p/test-plugin')
    use('wbthomason/packer.nvim')

    -- useful tools
    use('mbbill/undotree')
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use('tpope/vim-commentary')
    -- use('tpope/vim-dispatch')
    use('szw/vim-maximizer')
    use('buoto/gotests-vim')
    -- external utils
    use('puremourning/vimspector')
    --use({ 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install'](0) end, })
    use('airblade/vim-gitgutter')
    use('tpope/vim-fugitive')
    use('dbeniamine/cheat.sh-vim')
    -- code style / completion / helpers
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-textobjects')
    use('nvim-treesitter/nvim-treesitter-context')
    use('neovim/nvim-lspconfig')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/nvim-cmp')
    use('andrejlevkovitch/vim-lua-format')
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip') -- required for LuaSnip
    use('onsails/lspkind-nvim')
    use({ 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', })
    -- use'github/copilot.vim'
    use('ray-x/go.nvim')
    use({ 'prettier/vim-prettier', run = 'yarn install' })
    use('mechatroner/rainbow_csv')
    use({ 'ThePrimeagen/refactoring.nvim',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-treesitter/nvim-treesitter' } } })
    -- telescope/navigation
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use('nvim-telescope/telescope-file-browser.nvim')
    use({ 'nvim-telescope/telescope-ui-select.nvim' })
    use('ThePrimeagen/harpoon')
    -- themes
    use('gruvbox-community/gruvbox')
    use('folke/tokyonight.nvim')
    use('projekt0n/github-nvim-theme')
    use('shaunsingh/nord.nvim')
    use('EdenEast/nightfox.nvim')
    use('rebelot/kanagawa.nvim')
    use({ 'catppuccin/nvim', as = 'catppuccin' })
    -- misc
    use('hoob3rt/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')
    use('folke/todo-comments.nvim')
    use('kristijanhusak/vim-carbon-now-sh')
    use('tyru/current-func-info.vim')
    use({ 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end })
    use({ 'tpope/vim-dadbod', requires = 'tpope/vim-dotenv' })
    use({ 'kristijanhusak/vim-dadbod-ui', requires = 'tpope/vim-dadbod' })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
