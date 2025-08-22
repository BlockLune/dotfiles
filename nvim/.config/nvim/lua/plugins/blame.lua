return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    require("blame").setup({})
  end,
  keys = {
    {
      "<leader>gB",
      ":BlameToggle<cr>",
      desc = "[Git] Blame",
    },
  },
}
