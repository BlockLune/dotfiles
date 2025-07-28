return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  dependencies = {
    "saghen/blink.cmp",
  },
  keys = {
    {
      "<leader>um",
      ":Markview Toggle<cr>",
      desc = "[UI] Toggle Markview",
    },
  },
}
