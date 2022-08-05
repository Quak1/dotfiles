local lspconfig = require("lspconfig")
require("nvim-lsp-installer").setup({})
require("user.lsp.mason")
local handlers = require("user.lsp.handlers")
handlers.setup()

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	--capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

lspconfig["sumneko_lua"].setup(require("user.lsp.settings.sumneko_lua"))
lspconfig["tsserver"].setup({})
