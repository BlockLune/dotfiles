-- ---------------------
-- NeoVim Native Keymaps
-- ---------------------

-- My Leader Key
vim.g.mapleader = " "

-- Window Split
vim.keymap.set("n", "<leader>|", ":vsp<cr>", { desc = "Vertically Split" })
vim.keymap.set("n", "<leader>-", ":sp<cr>", { desc = "Horizontally Split" })

-- Navigate
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Navigate Left" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Navigate Down" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Navigate Up" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Navigate Right" })

-- Resize Window
vim.keymap.set("n", "<leader><up>", ":resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader><down>", ":resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader><left>", ":vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader><right>", ":vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Bufferline
vim.keymap.set("n", "H", ":bprev<cr>", { desc = "Switch to Previous Buffer" })
vim.keymap.set("n", "L", ":bnext<cr>", { desc = "Switch to Next Buffer" })

-- MISC
vim.keymap.set("i", "jk", "<esc>", { desc = "Return to Normal Mode with `jk`" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>qq", ":qa<cr>", { desc = "Quit All" })
