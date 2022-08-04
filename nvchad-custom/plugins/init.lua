return {

	-- enable dashboard
	["goolord/alpha-nvim"] = {
		disable = false,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		-- load it after nvim-lspconfig cuz we lazy loaded lspconfig
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["navarasu/onedark.nvim"] = {
		config = function()
			require("onedark").setup({
				style = "deep",
			})
		end,
	},
}
