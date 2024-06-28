return {
	"mbbill/undotree",
	--"tpope/vim-fugitive",
	--"tpope/vim-surround",
	--"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	--"dstein64/vim-startuptime",
	--"lewis6991/impatient.nvim",
	--"lukas-reineke/indent-blankline.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	--"ahmedkhalf/project.nvim", -- has telescope integration

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
