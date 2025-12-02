--  See `:help vim.keymap.set()`

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- map("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- map("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- map("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- map("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Close current buffer
map('n', '<leader>x', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Replay last macro
map('n', ',', '@@', { desc = 'Replay last used macro' })

-- Show cursor diagnostics
map('n', '<C-k>', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

-- Select all - in tmux need to press 2 times
map({ 'n', 'v', 'x' }, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })

-- Copy and paste from system clipboard
map({ 'n', 'v', 'x' }, '<leader>y', '"+y', { noremap = true, desc = 'Yank to clipboard' })
map({ 'n', 'v', 'x' }, '<leader>yy', '"+yy', { noremap = true, desc = 'Yank line to clipboard' })
map({ 'n', 'v', 'x' }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
map({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })

-- Move text up and down
local opts = { noremap = true, silent = true }
map('n', '<A-j>', '<Esc>:m .+1<CR>==', opts)
map('n', '<A-k>', '<Esc>:m .-2<CR>==', opts)
map('v', '<A-j>', ":move '>+0<CR>gv-gv", opts)
map('v', '<A-k>', ":move '<-2<CR>gv-gv", opts)
