return {
  "Saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = { preselect = true, auto_insert = true },
      },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },
  },
}
