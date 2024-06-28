local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- Completion engine
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		opts = function()
			require("lsp-zero").extend_cmp()

			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			local defaults = require("cmp.config.default")()
			return {
				-- cmp_luasnip setup
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				-- options for Insert mode completion
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				mapping = cmp.mapping.preset.insert({
					--["<C-e>"] = cmp.mapping.abort(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Space>"] = cmp.mapping.complete(),
					-- Accept currently selected item. Set `select` to `false`
					-- to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),

				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
						},
					}),
				},

				experimental = {
					ghost_text = { hl_group = "CmpGhostText" },
				},

				sorting = defaults.sorting,
			}
		end,
	},

	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},

	-- vim surround
	{
		"echasnovski/mini.surround",
		config = true,
	},

	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
			mappings = {
				comment = "<C-/>",
				comment_line = "<C-/>",
			},
		},
	},
}
