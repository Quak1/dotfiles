-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set filetype for .tmpl files
vim.filetype.add({
  extension = {
    tmpl = "html",
  },
})

-- Preserve exact window view (scroll + cursor) when switching buffers
local view = {}
vim.api.nvim_create_augroup("SaveWindowViewGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  group = "SaveWindowViewGroup",
  pattern = "*",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    view[buf] = vim.fn.winsaveview()
  end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = "SaveWindowViewGroup",
  pattern = "*",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if view[buf] then
      vim.fn.winrestview(view[buf])
    end
  end,
})
