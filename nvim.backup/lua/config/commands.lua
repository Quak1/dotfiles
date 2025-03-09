vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":q", {})
vim.api.nvim_create_user_command("Wq", ":wq", {})

vim.api.nvim_create_user_command("ListAllFormatters", function()
	local formatters = require("conform").list_all_formatters()
	for i, v in pairs(formatters) do
		print(v["name"], v["available"], v["available_msg"])
	end
end, {})

vim.api.nvim_create_user_command("ListFormatters", function()
	print("printing")
	local formatters = require("conform").list_formatters(0)
	for i, v in pairs(formatters) do
		print(v["name"], v["available"], v["available_msg"])
	end
end, {})

vim.api.nvim_create_user_command("ListFormattersToRun", function()
	print("printing")
	local formatters = require("conform").list_formatters_to_run(0)
	for i, v in pairs(formatters) do
		print(v["name"], v["available"], v["available_msg"])
	end
end, {})
