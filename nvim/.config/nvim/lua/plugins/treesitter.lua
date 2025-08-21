return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local parser_config =
      require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.wxml = {
      install_info = {
        url = "https://github.com/BlockLune/tree-sitter-wxml",
        files = { "src/parser.c", "src/scanner.c" },
        revision = "v0.2.0",
      },
    }

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
        "wxml",
      },
      ignore_install = {},
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      modules = {},
    })
  end,
}
