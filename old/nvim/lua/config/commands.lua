vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":q", {})
vim.api.nvim_create_user_command("Wq", ":wq", {})

--- Autocmds ---
vim.api.nvim_create_augroup("FormatAutogroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWrite",
	group = "FormatAutogroup",
})
