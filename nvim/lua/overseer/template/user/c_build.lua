return {
  name = "gcc c99 build /tmp",
  condition = {
    filetype = { "c" },
  },
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    local name = vim.fn.expand "%:t:r"
    local output = "/tmp/" .. name
    return {
      cmd = { "gcc" },
      args = { file, "-o", output, "-std=c99" },
      components = {
        { "on_exit_set_status" },
        { "open_output", on_complete = "always", focus = true },
        { "run_after", task_names = { { cmd = output } } },
      },
    }
  end,
}
