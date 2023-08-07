return {
    "mbbill/undotree",
    --"tpope/vim-fugitive",
    --"tpope/vim-surround",
    --"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    --"dstein64/vim-startuptime",
    --"lewis6991/impatient.nvim",
    --"lukas-reineke/indent-blankline.nvim",

    -- Colorschemes
    'navarasu/onedark.nvim',
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000, config = function()
        vim.cmd.colorscheme('nightfly')
    end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    --"ahmedkhalf/project.nvim", -- has telescope integration

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
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
            { 'L3MON4D3/LuaSnip' }, -- Snippet engine
            { 'rafamadriz/friendly-snippets' }, -- Snippets collection
        }
    },

    -- Greeting window
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    -- Tab and status lines
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    --{ "nvim-lualine/lualine.nvim", dependencies = "kyazdani42/nvim-web-devicons" },

    -- Comment
    --"numToStr/Comment.nvim",
    --"JoosepAlviste/nvim-ts-context-commentstring",

    -- Git
    --"lewis6991/gitsigns.nvim",

    -- File Explorer
    --{
      --"kyazdani42/nvim-tree.lua",
      --dependencies = "kyazdani42/nvim-web-devicons", -- optional, for file icons
      --},

}
