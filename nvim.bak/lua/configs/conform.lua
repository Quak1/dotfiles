local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    pug = { "prettierd" },
    markdown = { "prettierd" },
    python = { "black" },
    go = { "gofumpt", "golines" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
