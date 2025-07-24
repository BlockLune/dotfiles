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
        explorer = {
            enabled = true,
            focus = "list",
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
        picker = {
            enabled = true,
            focus = "list",
        },
        terminal = { enabled = true },
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
        { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
        { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
        { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
        { "<leader>e",       function() Snacks.explorer() end,               desc = "File Explorer" },
        {
            "<leader>p",
            function()
                require("telescope").extensions.yank_history.yank_history({})
            end,
            mode = { "n", "x" },
            desc = "Open Yank History",
        },

        -- File
        { "<leader>ff", function() Snacks.picker.files() end,                                                  desc = "[File] Find" },
        { "<leader>fg", function() Snacks.picker.grep() end,                                                   desc = "[File] Grep" },

        -- Git
        { "<c-g>",      function() Snacks.lazygit.open() end,                                                  desc = "Open LazyGit" },
        { "<leader>gb", function() Snacks.picker.git_branches() end,                                           desc = "[Git] Branches" },
        { "<leader>gB", function() Snacks.git.blame_line() end,                                                desc = "[Git] Blame Line" },
        { "<leader>gl", function() Snacks.picker.git_log() end,                                                desc = "[Git] Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,                                           desc = "[Git] Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end,                                             desc = "[Git] Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end,                                              desc = "[Git] Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,                                               desc = "[Git] Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end,                                           desc = "[Git] Log File" },

        -- Show in List
        { "<leader>sH", function() Snacks.picker.highlights() end,                                             desc = "[Show] Highlights" },
        { "<leader>sM", function() Snacks.picker.man() end,                                                    desc = "[Show] Man Pages" },
        { "<leader>sa", function() Snacks.picker.autocmds() end,                                               desc = "[Show] Autocmds" },
        { "<leader>sb", function() Snacks.picker.lines() end,                                                  desc = "[Show] Buffer Lines" },
        { "<leader>sc", function() Snacks.picker.command_history() end,                                        desc = "[Show] Command History" },
        { "<leader>sC", function() Snacks.picker.commands() end,                                               desc = "[Show] Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end,                                            desc = "[Show] Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                                     desc = "[Show] Buffer Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end,                                                   desc = "[Show] Help Pages" },
        { "<leader>si", function() Snacks.picker.icons() end,                                                  desc = "[Show] Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end,                                                  desc = "[Show] Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end,                                                desc = "[Show] Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end,                                                desc = "[Show] Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end,                                                  desc = "[Show] Marks" },
        { "<leader>sq", function() Snacks.picker.qflist() end,                                                 desc = "[Show] Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end,                                                 desc = "[Show] Resume (Picker List)" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                                            desc = "[Show] LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                                  desc = "[Show] LSP Workspace Symbols" },
        { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "[Show] TODO" },
        { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "[Show] TODO/FIX/FIXME" },
        { "<leader>su", function() Snacks.picker.undo() end,                                                   desc = "[Show] Undo History" },

        -- LSP
        { "gd",         function() Snacks.picker.lsp_definitions() end,                                        desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,                                       desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,                                         nowait = true,                        desc = "References" },
        { "gI",         function() Snacks.picker.lsp_implementations() end,                                    desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,                                   desc = "Goto T[y]pe Definition" },

        -- Buffer
        { "<leader>bd", function() Snacks.bufdelete() end,                                                     desc = "[Buffer] Delete Current" },
        { "<leader>bo", function() Snacks.bufdelete.other() end,                                               desc = "[Buffer] Delete Other" },

        -- UI
        { "<leader>uD", function() Snacks.dim() end,                                                           desc = "[UI] Toggle Dimming" },

        -- Terminal
        {
            "<c-/>",
            function()
                Snacks.terminal.toggle()
            end,
            mode = { "n", "t" },
            desc = "Toggle Terminal"
        },
        {
            "<c-t>",
            function()
                Snacks.terminal.open()
            end,
            mode = { "t" },
            desc = "Open another new terminal in terminal"
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
