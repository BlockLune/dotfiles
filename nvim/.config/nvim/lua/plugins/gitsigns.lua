return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  opts = {
    current_line_blame = true,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()
  end,
  keys = {
    {
      "[c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "[Git] Previous Change",
    },
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
      desc = "[Git] Next Change",
    },
    {
      "<leader>ghs",
      ":Gitsigns stage_hunk<CR>",
      mode = { "n", "v" },
      desc = "[Git] Stage Hunk",
    },
    {
      "<leader>ghr",
      ":Gitsigns reset_hunk<CR>",
      mode = { "n", "v" },
      desc = "[Git] Reset Hunk",
    },
    {
      "<leader>ghS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "[Git] Stage Buffer",
    },
    {
      "<leader>ghR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "[Git] Reset Buffer",
    },
    {
      "<leader>ghp",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "[Git] Preview Hunk Inline",
    },
  },
}
