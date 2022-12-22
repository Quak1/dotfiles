-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim') -- Have packer manage itself
    use("mbbill/undotree")
    --use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    --use("dstein64/vim-startuptime")
    --use("lewis6991/impatient.nvim")
    --use("lukas-reineke/indent-blankline.nvim")

    -- Colorschemes
    use('navarasu/onedark.nvim')

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    --use("ahmedkhalf/project.nvim") -- has telescope integration

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- LSP
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })

    -- Greeting window
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- Tab and status lines
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    --use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- Comment
    --use("numToStr/Comment.nvim")
    --use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Git
    --use("lewis6991/gitsigns.nvim")

    -- File Explorer
    --use({
      --"kyazdani42/nvim-tree.lua",
      --requires = "kyazdani42/nvim-web-devicons", -- optional, for file icons
      --})

end)
