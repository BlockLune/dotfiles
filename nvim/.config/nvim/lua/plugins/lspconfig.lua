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

    -- Wechat Miniprogram
    vim.filetype.add({
      extension = {
        wxml = "wxml",
        wxss = "wxss",
      },
    })
    vim.lsp.config("glass_easel_analyzer", {
      cmd = { "/path/to/glass-easel-analyzer-repo/target/release/glass-easel-analyzer" },
      filetypes = { "wxml", "wxss", "css", "less", "scss" },
      root_markers = { "app.json", "plugin.json" },
      init_options = {
        -- The server expects the TOML contents here, not a path.
        backendConfig = table.concat(vim.fn.readfile(
          "/path/to/glass-easel-analyzer-repo/backend-configuration/web/web.toml"
        ), "\n"),
        -- Required by glass-easel-analyzer; populated with the project URI below.
        workspaceFolders = {},
        ignorePaths = { "node_modules" },
        enableOtherSs = false,
      },
      before_init = function(params, config)
        params.initializationOptions.workspaceFolders = {
          vim.uri_from_fname(config.root_dir),
        }
      end,
    })
    vim.lsp.enable("glass_easel_analyzer")
  end,
}
