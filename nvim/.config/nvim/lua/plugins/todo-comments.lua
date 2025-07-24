return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Previous Todo Comment"
        },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next Todo Comment"
        },

        -- And more in `snacks.lua` ...
    },
}
