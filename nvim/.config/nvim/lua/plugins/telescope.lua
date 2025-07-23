return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files<cr>",  desc = "[Telescope] Find Files" },
        { "<leader>ff",      "<cmd>Telescope find_files<cr>",  desc = "[File] Find Files" },
        { "<leader>fg",      "<cmd>Telescope live_grep<cr>",   desc = "[File] Live Grep" },
        { "<leader>sd",      "<cmd>Telescope diagnostics<cr>", desc = "[Show] Diagnostics" },
        { "<leader>sj",      "<cmd>Telescope jumplist<cr>",    desc = "[Show] Jumplist" },
        { "<leader>sk",      "<cmd>Telescope keymaps<cr>",     desc = "[Show] Keymaps" },
        { "<leader>sl",      "<cmd>Telescope loclist<cr>",     desc = "[Show] Loclist" },
        { "<leader>sm",      "<cmd>Telescope marks<cr>",       desc = "[Show] Marks" },
        { "<leader>sq",      "<cmd>Telescope quickfix<cr>",    desc = "[Show] Quickfix List" },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("git_signs")
    end
}
