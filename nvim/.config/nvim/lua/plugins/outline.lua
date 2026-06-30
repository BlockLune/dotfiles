return {
  "hedyhli/outline.nvim",
  event = "BufReadPost",
  opts = {
    outline_window = {
      width = 20,
    },
  },
  keys = {
    {
      "<leader>cs",
      ":Outline<cr>",
      desc = "[Code] Symbols",
    },
  },
  config = function(_, opts)
    local outline = require("outline")
    outline.setup(opts)

    local function close_outline_if_last_window()
      vim.schedule(function()
        if not outline.is_open() then
          return
        end

        local normal_windows = vim.tbl_filter(function(win)
          return vim.api.nvim_win_is_valid(win)
            and vim.api.nvim_win_get_config(win).relative == ""
        end, vim.api.nvim_tabpage_list_wins(0))

        if #normal_windows ~= 1 then
          return
        end

        local buf = vim.api.nvim_win_get_buf(normal_windows[1])
        if vim.bo[buf].filetype == "Outline" then
          outline.close()
        end
      end)
    end

    vim.api.nvim_create_autocmd("WinClosed", {
      callback = close_outline_if_last_window,
    })

    local auto_opened_once = false
    vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "FileType" }, {
      callback = function()
        if auto_opened_once then
          return
        end
        if outline.has_provider() then
          vim.cmd("OutlineOpen!")
        end
      end,
    })
  end,
}
