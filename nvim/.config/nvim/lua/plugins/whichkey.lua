return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<leader>b", icon = "", group = "+ Buffer" },
      { "<leader>c", icon = "󰘦", group = "+ Code" },
      { "<leader>f", icon = "󰈔", group = "+ File" },
      { "<leader>g", icon = "󰊢", group = "+ Git" },
      { "<leader>q", icon = "󰒓", group = "+ Quit" },
      { "<leader>s", icon = "󰈈", group = "+ Show" },
      { "<leader>u", icon = "󰉼", group = "+ UI" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
