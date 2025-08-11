-- ----------
-- Entry file
-- ----------

-- Keymaps (NeoVim Plugins' excluded)
require("keymaps.common").setup()
if vim.g.vscode then
  require("keymaps.vscode").setup()
else
  require("keymaps.neovim").setup()
end

-- NeoVim Native Options
require("options")

-- Load Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
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
  {
    import = "plugins.blinkcmp",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.bufferline",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.conform",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.github-theme",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.gitsigns",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.hardtime", cond = true },
  {
    import = "plugins.hlslens",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.lazydev",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.lightbulb",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.lspconfig",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.lualine",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.mini-ai", cond = true },
  { import = "plugins.mini-comment", cond = true },
  { import = "plugins.mini-pairs", cond = true },
  {
    import = "plugins.outline",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.repeat", cond = true },
  {
    import = "plugins.scrollbar",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.snacks",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.surround", cond = true },
  {
    import = "plugins.todo-comments",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.treesitter", cond = true },
  { import = "plugins.trim", cond = true },
  {
    import = "plugins.trouble",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.ts-autotag",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.ts-context-commentstring", cond = true },
  {
    import = "plugins.ufo",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.undotree",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.wakatime",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.whichkey",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "plugins.wxapp",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.yanky", cond = true },
})
