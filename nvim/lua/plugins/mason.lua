return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "html",
      "cssls",
      "ts_ls",
      "gopls",
      "pyright",
    },
  },
}
