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
      cmd = { "/opt/glass-easel-analyzer/target/release/glass-easel-analyzer" },
      filetypes = { "wxml", "wxss", "css", "less", "scss" },
      root_markers = { "app.json", "plugin.json" },
      -- Do not start this project-scoped server when no project root is found.
      workspace_required = true,
      init_options = {
        -- The server expects the TOML contents here, not a path.
        backendConfig = table.concat(
          vim.fn.readfile(
            "/opt/glass-easel-analyzer/backend-configuration/web/web.toml"
          ),
          "\n"
        ),
        -- Required by glass-easel-analyzer; populated with the project URI below.
        workspaceFolders = {},
        ignorePaths = { "node_modules" },
        enableOtherSs = true,
      },
      before_init = function(params, config)
        if not config.root_dir then
          return
        end

        params.initializationOptions.workspaceFolders = {
          vim.uri_from_fname(config.root_dir),
        }
      end,
    })
    vim.lsp.enable("glass_easel_analyzer")
  end,
}
