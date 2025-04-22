require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at current line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Add breakpoint at current line" })

-- copy into system register
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- deletes into void register before pasting
map("x", "<leader>p", [["_dP]])

-- delete to void register
map({ "n", "v" }, "<leader>d", [["_d]])

-- disable Q
map("n", "Q", "<nop>")

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
map("v", "<A-j>", ":move '>+0<CR>gv-gv", opts)
map("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
