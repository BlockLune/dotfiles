return {
    "folke/lazydev.nvim",
    enabled = not vim.g.vscode,
    ft = "lua",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
