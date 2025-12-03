return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>z", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "<leader>x" },
      },
    },
  },
}
