-- add line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- improve search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- set colors for multiple plugins
vim.opt.termguicolors = true
vim.opt.syntax = "enable"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- disable mouse support
vim.opt.mouse = ""

vim.opt.cursorline = true

vim.filetype.add({
	extension = {
		ejs = "html",
	},
})
