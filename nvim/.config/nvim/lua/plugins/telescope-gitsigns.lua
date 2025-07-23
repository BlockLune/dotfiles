return {
    "radyz/telescope-gitsigns",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>sgh", "<cmd>Telescope git_signs<cr>", desc = "[Show] Git Signs Hunks" },
    }
}
