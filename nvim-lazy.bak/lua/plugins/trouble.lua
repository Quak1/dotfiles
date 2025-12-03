return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", false },
    { "<leader>zx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },

    { "<leader>xX", false },
    { "<leader>zX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },

    { "<leader>xL", false },
    { "<leader>zL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },

    { "<leader>xQ", false },
    { "<leader>zQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
  },
}
