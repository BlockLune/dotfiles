return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "cssls",         -- CSS
                    "html",          -- HTML
                    "lua_ls",        -- Lua
                    -- "pylsp",         -- Python
                    "ts_ls",         -- TypeScript
                    "vimls",         -- Vim
                    "rust_analyzer", -- Rust
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
    end
}
