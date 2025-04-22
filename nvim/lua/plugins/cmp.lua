return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local config = require "nvchad.configs.cmp"
    config.mapping["<Esc>"] = cmp.mapping.abort()
    --opts.completion.completeopt = "menu,menuone,noselect"
  end,
}
