require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- general
map("i", "jk", "<ESC>", { desc = "use `jk` to reset to normal mode" })
map("n", "<leader>qq", ":qa<CR>", { desc = "quick quit" })

-- split
map("n", "<leader>|", ":vsp<CR>", { desc = "vertical split" })
map("n", "<leader>-", ":sp<CR>", { desc = "horizontal split" })

-- tabufline
local tabufline = require "nvchad.tabufline"

map("n", "<leader>bd", function()
  tabufline.close_buffer()
end, { desc = "close current buffer" })

map("n", "<leader>bo", function()
  tabufline.closeAllBufs(false)
end, { desc = "close all bufs, current excluded" })

nomap("n", "<s-tab>")
map("n", "H", function()
  tabufline.prev()
end, { desc = "buffer goto prev" })

nomap("n", "<tab>")
map("n", "L", function()
  tabufline.next()
end, { desc = "buffer goto next" })

-- nvimtree
nomap("n", "<c-n>", { desc = "disable the default toggle setting" })
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
map("n", "<leader><leader>", ":Telescope fd<CR>")

-- terminal
local term = require "nvchad.term"
map({ "n", "t" }, "<c-/>", function()
  term.toggle({pos="sp", id="toggleTerm"})
end)

