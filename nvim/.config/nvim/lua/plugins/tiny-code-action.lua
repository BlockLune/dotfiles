return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {},
    keys = {
        {
            "<leader>ca",
            function()
                require("tiny-code-action").code_action()
            end,
            noremap = true,
            silent = true,
            desc = "[Code] Code Action",
        }
    }
}
