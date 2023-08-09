local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader
--vim.g.mapleader = " "

-- open file explorer
keymap("n", "<leader>e", vim.cmd.Ex)

-- keep cursor at same place
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

-- format file
keymap("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
--keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
--keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- change word under cursor in the whole file
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

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

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- disable search highlight temporarily
keymap("n", "<esc>", ":noh<CR>", opts)

---------- Visual ----------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

---------- Visual Block ----------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---------- Terminal ----------
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

---------- Telescope ---------
--keymap("n", "ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
--keymap("n", "ff", ":Telescope find_files<CR>", opts)
--keymap("n", "<c-t>", ":Telescope live_grep<CR>", opts)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

---------- Comment.nvim ---------
--keymap(
--"n",
--"<C-_>",
--"v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
--{ expr = true, remap = true }
--)
--keymap("x", "<C-_>", "<Plug>(comment_toggle_blockwise_visual)", opts)

-- Nvimtree
--keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)

---------- vim Fugitive -------------
keymap("n", "<leader>gs", vim.cmd.Git)

----------- undotree ---------------
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
