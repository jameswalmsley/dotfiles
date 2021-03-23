-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Information
    use 'nanotee/nvim-lua-guide'

    -- Quality of life improvements
    use 'norcalli/nvim_utils'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'

    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'mattn/emmet-vim'
    use 'hrsh7th/vim-vsnip'
    use 'xabikos/vscode-javascript'
    use 'dsznajder/vscode-es7-javascript-react-snippets'
    use 'golang/vscode-go'
    use 'rust-lang/vscode-rust'
    use 'ChristianChiarulli/html-snippets'
    use 'ChristianChiarulli/java-snippets'
    use 'ChristianChiarulli/python-snippets'
    -- use 'cstrap/python-snippets'
    -- use 'ylcnfrht/vscode-python-snippet-pack'
    -- use 'SirVer/ultisnips'
    -- use 'norcalli/snippets.nvim'


    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use 'romgrk/barbar.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'jameswalmsley/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-fzf-writer.nvim'

    -- Debug DAP
    use 'nvim-telescope/telescope-dap.nvim'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'


    -- Explorer
    use 'kyazdani42/nvim-tree.lua'


    -- Color
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'
    use 'morhetz/gruvbox'
    use 'lifepillar/vim-solarized8'
    use 'windwp/wind-colors'

    -- Git
    use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'jameswalmsley/phabrik'

    -- Easily Create Gists
    use 'mattn/vim-gist'
    use 'mattn/webapi-vim'

    -- Webdev
    use 'windwp/nvim-ts-autotag'
    use 'gennaro-tedesco/nvim-jqx'
    use 'turbio/bracey.vim'

    -- Registers
    use 'gennaro-tedesco/nvim-peekup'

    -- Navigation
    use 'unblevable/quick-scope'
    use 'phaazon/hop.nvim'
    use 'kevinhwang91/rnvimr'

    -- General Plugins
    use 'liuchengxu/vim-which-key'
    use 'kevinhwang91/nvim-bqf'
    use 'airblade/vim-rooter'
    use 'glepnir/dashboard-nvim'
    use 'metakirby5/codi.vim'
    use 'psliwka/vim-smoothie'
    use 'moll/vim-bbye'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    use 'voldikss/vim-floaterm'
    use 'liuchengxu/vista.vim'
    use 'terrortylor/nvim-comment'
    use 'bfredl/nvim-miniyank'
    use 'monaqa/dial.nvim'
    use 'junegunn/goyo.vim'
    use 'andymass/vim-matchup'
    use 'windwp/nvim-autopairs'
    use 'blackcauldron7/surround.nvim'

    -- TODO put this back when stable for indent lines
    -- 	use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    -- 	vim.g.indent_blankline_space_char = ' '
    -- 	vim.g.indent_blankline_buftype_exclude = {'terminal'}
    -- 	vim.g.indent_blankline_filetype_exclude = {'help', 'startify'}
    -- 	vim.g.indent_blankline_char = '▏'
    -- 	vim.g.indent_blankline_use_treesitter=true
    -- use 'AndrewRadev/tagalong.vim'
    -- use 'alvan/vim-closetag'
    -- use 'RRethy/vim-illuminate'
    -- use 'b3nj5m1n/kommentary'
    -- use {
    --     'glacambre/firenvim',
    --     run = function()
    --         vim.fn['firenvim#install'](1)
    --     end
    -- }
    -- use 'tpope/vim-sleuth'
    -- use 'mhinz/vim-startify'
    use 'jeffkreeftmeijer/vim-numbertoggle'
end)
