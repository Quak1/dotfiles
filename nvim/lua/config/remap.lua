local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open file explorer
--keymap("n", "<leader>e", vim.cmd.Ex)

-- keep cursor at same place after using 'J'
keymap("n", "J", "mzJ`z")

-- center cursor with movement
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- deletes into void register before pasting
keymap("x", "<leader>p", [["_dP]])

-- copy into system register
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- delete to void register
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- disable Q
keymap("n", "Q", "<nop>")

-- format file | format shortcut in lsp.lua file
--keymap("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
--keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
--keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- change word under cursor in the whole file
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---------- Normal ----------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<C-q>", ":bd<CR>", opts) -- close buffer

-- disable search highlight temporarily
keymap("n", "<esc>", ":noh<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)
keymap("v", "<A-j>", ":move '>+0<CR>gv-gv", opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv", opts)
