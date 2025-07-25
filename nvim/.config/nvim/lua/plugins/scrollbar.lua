return {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {
        handlers = {
            gitsigns = true,
            search = true,
        },
        marks = {
            Search = {
                color = "#CBA6F7",
            },
            GitAdd = { text = "|" },
            GitChange = { text = "|" },
        }
    }
}
