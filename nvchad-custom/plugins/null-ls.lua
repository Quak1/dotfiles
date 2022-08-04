local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	-- Lua
	b.formatting.stylua,
}

-- format on save config
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.formatting_sync()
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
