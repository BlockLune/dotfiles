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

    -- WXML (Wechat Miniprogram)
    -- vim.filetype.add({
    --   extension = {
    --     wxml = "wxml",
    --   },
    -- })

    -- Run `npm install -g wxml-langserver` to install the lang server
    -- vim.lsp.config["wxml-langserver"] = {
    --   cmd = { "wxml-langserver", "--stdio" },
    --   filetypes = { "wxml" },
    --   root_markers = { "package.json", ".git" },
    -- }
    -- vim.lsp.enable("wxml-langserver")
  end,
}
