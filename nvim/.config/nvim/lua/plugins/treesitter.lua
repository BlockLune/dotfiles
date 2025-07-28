return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "c",
        "css",
        "html",
        "javascript",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
      },
      ignore_install = {},
      sync_install = false,
      hightlight = { enabled = true },
      indent = { enabled = true },
      modules = {},
    })
  end,
}
