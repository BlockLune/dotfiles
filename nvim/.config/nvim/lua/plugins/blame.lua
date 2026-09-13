local function theme_colors()
  local groups = {
    "DiagnosticInfo",
    "DiagnosticHint",
    "DiagnosticWarn",
    "DiagnosticError",
    "String",
    "Function",
    "Type",
    "Keyword",
  }
  local colors = {}

  for _, group in ipairs(groups) do
    local fg = vim.api.nvim_get_hl(0, { name = group, link = false }).fg
    if fg then
      colors[#colors + 1] = string.format("#%06x", fg)
    end
  end

  return colors
end

return {
  "FabijanZulj/blame.nvim",
  lazy = false,
  config = function()
    require("blame").setup({ colors = theme_colors() })
  end,
  keys = {
    {
      "<leader>gB",
      ":BlameToggle<cr>",
      desc = "[Git] Blame",
    },
  },
}
