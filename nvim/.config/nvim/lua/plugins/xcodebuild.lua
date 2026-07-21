return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "folke/snacks.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("xcodebuild").setup({})
  end,
  keys = {
    {
      "<leader>X",
      ":XcodebuildPicker<cr>",
      desc = "[Xcodebuild] Picker",
    },
  },
}
