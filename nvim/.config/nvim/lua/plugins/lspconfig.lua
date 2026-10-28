return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          "rumdl", -- markdown
          "stylua", -- Lua
        },
      },
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "lua_ls", -- Lua
          "vimls", -- Vim
        },
        automatic_enable = {
          exclude = {},
        },
      },
    },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
    })

    -- Apple sourcekit (swift, objective-c, etc.)
    vim.lsp.enable("sourcekit")

    -- WeChat Mini Program
    vim.filetype.add({
      extension = {
        wxml = "wxml",
        wxss = "css",
        wxs = "javascript",
      },
    })
    vim.lsp.config("wxmls", {
      cmd = { "wxmls" },
      filetypes = { "wxml" },
      root_markers = { "app.json", "project.config.json", ".git" },
    })
    vim.lsp.enable("wxmls")
  end,
}
