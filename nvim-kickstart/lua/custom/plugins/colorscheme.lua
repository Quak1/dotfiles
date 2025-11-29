return {
  -- {
  --   "akinsho/bufferline.nvim",
  --   init = functio()
  --     local bufline = require("catppuccin.groups.integrations.bufferline")
  --     function bufline.get()
  --       return bufline.get_theme()
  --     end
  --   end,
  -- },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = {
      style = 'night',
    },
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = true,
    priority = 1000,
    init = function()
      vim.g.nightflyItalics = false
    end,
  },
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = true,
    priority = 1000,
  },
}
