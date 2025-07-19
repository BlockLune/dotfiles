-- nvim-telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope find_files<cr>", { desc = "Telescope find files" })

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle Nvim Tree" })

-- snacks.nvim
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })

