return {
  -- {
  --   "Zeioth/compiler.nvim",
  --   cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  --   dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
  --   opts = {},
  -- },
  {
    "stevearc/overseer.nvim",
    -- cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    cmd = { "OverseerRun" },
    opts = {
      templates = {
        "builtin",
        "user.c_build",
      },
      task_list = {
        direction = "bottom",
        min_height = 0.2,
        max_height = 0.5,
        default_detail = 1,
      },
    },
  },
}
