return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    explorer = {},
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  keys = {
    --stylua: ignore start
    { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
    --stylua: ignore end
  },
}
