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


    -- WXML (Wechat Miniprogram)
    vim.filetype.add({
      extension = {
        wxml = "wxml",
      },
    })

    -- Run `npm install -g wxml-langserver` to install the lang server
    vim.lsp.config["wxml-langserver"] = {
      cmd = { "wxml-langserver", "--stdio" },
      filetypes = { "wxml" },
      root_markers = { "package.json", ".git" },
    }
    vim.lsp.enable("wxml-langserver")
  end,
}
