return {
    "catppuccin/nvim",
    enabled = not vim.g.vscode,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin-macchiato")
    end
}
