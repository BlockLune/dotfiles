return {
  "hedyhli/outline.nvim",
  event = "BufReadPost",
  opts = {
    outline_window = {
      width = 20,
    },
  },
  keys = {
    {
      "<leader>cs",
      ":Outline<cr>",
      desc = "[Code] Symbols",
    },
  },
  config = function(_, opts)
    require("outline").setup(opts)

    local auto_opened_once = false
    vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "FileType" }, {
      callback = function()
        if auto_opened_once then
            return
        end
        if require("outline").has_provider() then
          vim.cmd("OutlineOpen!")
        end
      end,
    })
  end,
}
