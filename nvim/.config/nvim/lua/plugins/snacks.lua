return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        dashboard = { enabled = true },
        dim = {
            animate = { enabled = false },
        },
        git = { enabled = true },
        image = { enabled = true },
        indent = {
            animate = { enabled = false },
            chunk = { enabled = true },
            indent = { only_scope = true, },
            scope = {
                enabled = true,
                underline = true,
            },
        },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {
        {
            "<leader>bd",
            function()
                Snacks.bufdelete()
            end,
            desc = "[Buffer] Delete Current",
        },
        {
            "<leader>bo",
            function()
                Snacks.bufdelete.other()
            end,
            desc = "[Buffer] Delete Other",
        },
        {
            "<leader>uD",
            function()
                Snacks.dim()
            end,
            desc = "[UI] Toggle Dimming",
        },
        {
            "<leader>gb",
            function()
                Snacks.git.blame_line()
            end,
            desc = "[Git] Blame Line"
        },
        {
            "<c-g>",
            function()
                Snacks.lazygit.open()
            end,
            desc = "Open LazyGit"
        },
        {
            "<leader>n",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Show Notification History"
        },
        {
            "<c-/>",
            function()
                Snacks.terminal.toggle()
            end,
            mode = { "n", "t" },
            desc = "Toggle Terminal",
        },
        {
            "<c-t>",
            function()
                Snacks.terminal.open()
            end,
            mode = { "t" },
            desc = "Open another new terminal in terminal",
        },
        {
            "<c-w>",
            function()
                local terminal = Snacks.terminal.get()
                if terminal then
                    terminal:close()
                end
            end,
            mode = { "t" },
            desc = "Close the current terminal",
        },
    }
}
