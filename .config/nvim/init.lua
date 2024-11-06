-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font"
end