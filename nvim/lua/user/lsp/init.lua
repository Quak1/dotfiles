require("user.lsp.mason")
local lspconfig = require("lspconfig")
local handlers = require("user.lsp.handlers")
handlers.setup()

-- The global defaults for all servers can be
-- overridden by extending the `default_config` table
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	--capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

-- Server specific configuration
lspconfig["sumneko_lua"].setup(require("user.lsp.settings.sumneko_lua"))
lspconfig["tsserver"].setup({})
