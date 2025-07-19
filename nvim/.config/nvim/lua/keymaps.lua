vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<esc>", { desc = "Return to Normal Mode with `jk`" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>qq", ":qa<cr>", { desc = "Quit All" })

vim.keymap.set("n", "<leader>|", ":vsp<cr>", { desc = "Vertically Split" })
vim.keymap.set("n", "<leader>-", ":sp<cr>", { desc = "Horizontally Split" })


vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Navigate Left" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Navigate Down" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Navigate Up" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Navigate Right" })

vim.keymap.set("n", "H", ":bprev<cr>", { desc = "Switch to Previous Buffer" })
vim.keymap.set("n", "L", ":bnext<cr>", { desc = "Switch to Next Buffer" })

