return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      symbols = {
        focus = false,
      },
    },
  },
  keys = {
    {
      "<leader>D",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Open Diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[Code] Symbols",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "[Code] LSP Definitions / references / ...",
    },
  },
  config = function(_, opts)
    require("trouble").setup(opts)

    local symbols_opened = false
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function()
        if not symbols_opened then
          require("trouble").open("symbols")
          symbols_opened = true
        end
      end,
    })
  end,
}
