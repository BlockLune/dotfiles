return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          -- Python
          -- "black",
          -- "isort",
          -- "pylsp",

          -- Prettier
          "prettier",
          "prettierd",

          -- Web
          "cssls", -- CSS
          "html", -- HTML
          "ts_ls", -- TypeScript & JavaScript

          -- Markdown
          "markdownlint",

          -- Lua
          "lua_ls",
          "stylua",

          -- Rust
          "rust_analyzer",

          -- Vim
          "vimls",
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
  end,
}
