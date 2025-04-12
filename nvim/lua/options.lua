require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

-- disable mouse support
o.mouse = ""
o.relativenumber = true
o.wrap = false

-- o.tabstop = 4
-- o.softtabstop = 4
-- o.shiftwidth = 4
-- o.expandtab = true
o.smartindent = true

-- improve search highlighting
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- set colors for multiple plugins
o.termguicolors = true
o.syntax = "enable"

o.scrolloff = 8
o.colorcolumn = "80"

-- vim.filetype.add({
-- 	extension = {
-- 		ejs = "html",
-- 	},
-- })
