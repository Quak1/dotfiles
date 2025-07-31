return function(_, opts)
  opts.auto_install = true
  vim.list_extend(opts.ensure_installed, {
    "python",
  })
end
