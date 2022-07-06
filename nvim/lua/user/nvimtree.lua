-- For a list of available configuratons:
-- :help nvim-tree-setup
require("nvim-tree").setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  view = {
    -- side = "right",
  },
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  renderer = {
    highlight_git = true,
  },
}
-- Auto close when last window open
-- https://github.com/kyazdani42/nvim-tree.lua/discussions/1115
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
