-- ----------
-- Entry file
-- ----------


-- NeoVim Native Keymaps
require("keymaps")


-- NeoVim Native Options
require("options")


-- Load Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.autopairs"),
    require("plugins.blinkcmp"),
    require("plugins.bufferline"),
    require("plugins.catppuccin"),
    require("plugins.hardtime"),
    require("plugins.lazydev"),
    require("plugins.lspconfig"),
    require("plugins.mason"),
    require("plugins.snacks"),
    require("plugins.telescope"),
    require("plugins.tree"),
    require("plugins.treesitter"),
    require("plugins.whichkey"),
})


