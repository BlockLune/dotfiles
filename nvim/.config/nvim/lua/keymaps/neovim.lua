-- --------------------------
-- NeoVim Native Only Keymaps
-- --------------------------

local M = {}

function M.setup()
  -- General Utilities
  vim.keymap.set("i", "jk", "<esc>", { desc = "Exit Insert Mode" })
  vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex Mode" })
  vim.keymap.set("n", "p", "pgvy", { desc = "Paste and Reselect" })
  vim.keymap.set("n", "<leader>qq", ":qa<cr>", { desc = "Quit All Windows" })

  -- Navigate Windows
  vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Navigate to Left Window" })
  vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Navigate to Window Below" })
  vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Navigate to Window Above" })
  vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Navigate to Right Window" })

  -- Window Splits
  vim.keymap.set("n", "<leader>|", ":vsp<cr>", { desc = "Split Window Vertically" })
  vim.keymap.set("n", "<leader>-", ":sp<cr>", { desc = "Split Window Horizontally" })

  -- Resize Windows
  vim.keymap.set("n", "<leader><up>", ":resize +2<cr>", { desc = "Increase Window Height" })
  vim.keymap.set("n", "<leader><down>", ":resize -2<cr>", { desc = "Decrease Window Height" })
  vim.keymap.set("n", "<leader><left>", ":vertical resize -2<cr>", { desc = "Decrease Window Width" })
  vim.keymap.set("n", "<leader><right>", ":vertical resize +2<cr>", { desc = "Increase Window Width" })

  -- Buffer Navigation
  vim.keymap.set("n", "H", ":bprev<cr>", { desc = "Go to Previous Buffer" })
  vim.keymap.set("n", "L", ":bnext<cr>", { desc = "Go to Next Buffer" })

  -- LSP Keymaps
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover Documentation" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })

  -- Diagnostic Navigation
  vim.keymap.set("n", "[e", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "Go to Previous Error" })
  vim.keymap.set("n", "]e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
  end, { desc = "Go to Next Error" })
  vim.keymap.set("n", "[w", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
  end, { desc = "Go to Previous Warning" })
  vim.keymap.set("n", "]w", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
  end, { desc = "Go to Next Warning" })
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, { desc = "Go to Previous Diagnostic" })
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, { desc = "Go to Next Diagnostic" })
end

return M
