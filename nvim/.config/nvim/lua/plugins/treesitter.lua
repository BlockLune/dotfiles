return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "javascript", "css", "html", "rust"
            },
            ignore_install = {},
            sync_install = false,
            hightlight = { enabled = true },
            indent = { enabled = true },
            modules = {},
        })
    end
}
