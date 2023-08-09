return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },

	opts = {
		-- A list of parser names, or "all"
		ensure_installed = { "lua", "javascript", "typescript", "html", "json" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (for "all")
		-- ignore_install = { "javascript" },

		indent = { enable = true },
		highlight = {
			enable = true,
			-- disable = { "c", "rust" }, -- list of language that will be disabled
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
