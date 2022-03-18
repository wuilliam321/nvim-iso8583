require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- useful tools
  use 'mbbill/undotree'
  -- use 'wincent/scalpel'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'szw/vim-maximizer'
  use 'tweekmonster/gofmt.vim'
  use 'buoto/gotests-vim'
  -- external utils
  -- use 'mhinz/vim-startify'
  use 'puremourning/vimspector'
  use {'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install'](0) end}
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'dbeniamine/cheat.sh-vim'
  -- code style / completion / helpers
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-cmp'
  use {'tzachar/cmp-tabnine', run = './install.sh' }
  use 'onsails/lspkind-nvim'
  use 'mfussenegger/nvim-jdtls'
  use 'github/copilot.vim'
  use 'ray-x/go.nvim'
  -- use 'hrsh7th/vim-vsnip'
  -- use 'hrsh7th/vim-vsnip-integ'
  use {'prettier/vim-prettier', run = 'yarn install'}
  use 'mechatroner/rainbow_csv'
  -- use 'udalov/kotlin-vim' " not needed for now
  -- telescope/novigation
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'ThePrimeagen/harpoon'
  -- misc
  use 'gruvbox-community/gruvbox'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/todo-comments.nvim'
  use 'tyru/current-func-info.vim'
  use 'kristijanhusak/vim-carbon-now-sh'
  -- use 'romgrk/nvim-treesitter-context'
end)
