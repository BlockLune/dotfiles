return {
    "nvim-tree/nvim-tree.lua",
    enabled = not vim.g.vscode,
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({})
    end,
    keys = {
        { "<leader>e", ":NvimTreeFindFileToggle<cr>", desc = "Toggle Nvim Tree" }
    }
}
