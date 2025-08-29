return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
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
      "wxml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = require("nvim-treesitter").get_installed(),
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
