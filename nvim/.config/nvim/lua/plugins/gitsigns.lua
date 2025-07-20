return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
        current_line_blame = true,
    },
    config = function(_, opts)
        require("gitsigns").setup(opts)
        require("scrollbar.handlers.gitsigns").setup()
    end,
    keys = {
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            desc = "[Git] Previous Change",
        },
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            desc = "[Git] Next Change",
        },
        {
            "<leader>gp",
            function()
                require("gitsigns").preview_hunk_inline()
            end,
            desc = "[Git] Preview Change"
        },
        {
            "<leader>gq",
            function()
                require("gitsigns").setqflist()
            end,
            desc = "[Git] Show Changes in QuickFix List",
        }
    }
}
