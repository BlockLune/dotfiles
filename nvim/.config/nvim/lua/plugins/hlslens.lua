return {
    "kevinhwang91/nvim-hlslens",
    keys = { "n", "N", "*", "#", "g*", "g#" },
    opts = {},
    config = function(_, opts)
        require("scrollbar.handlers.search").setup(opts)
        vim.api.nvim_set_hl(0, "HlSearchLens", { link = "CurSearch" })
        vim.api.nvim_set_hl(0, "HlSearchLensNear", { fg = "#CBA6F7" })
    end,
}
