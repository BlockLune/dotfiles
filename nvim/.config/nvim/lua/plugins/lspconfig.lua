return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ensure_installed = {
          -- Python
          -- "black",
          -- "isort",

          -- Prettier
          "prettier",
          "prettierd",

          -- Markdown
          "markdownlint",

          -- Lua
          "stylua",
        },
      },
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          -- Python
          -- "pylsp",

          -- Web
          "cssls", -- CSS
          "html", -- HTML
          "ts_ls", -- TypeScript & JavaScript

          -- Lua
          "lua_ls",

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
