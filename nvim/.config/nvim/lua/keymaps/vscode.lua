-- ---------------------
-- VSCode-NeoVim Keymaps
-- ---------------------

local M = {}

function M.setup()
  local vscode = require("vscode")

  -- Window Splits
  vim.keymap.set("n", "<leader>|", function()
    vscode.action("workbench.action.splitEditorRight")
  end, { desc = "Split Editor Right" })
  vim.keymap.set("n", "<leader>-", function()
    vscode.action("workbench.action.splitEditorDown")
  end, { desc = "Split Editor Down" })

  -- Buffer/Tab Navigation
  vim.keymap.set("n", "H", function()
    vscode.action("workbench.action.previousEditor")
  end, { desc = "Go to Previous Editor" })
  vim.keymap.set("n", "L", function()
    vscode.action("workbench.action.nextEditor")
  end, { desc = "Go to Next Editor" })
  vim.keymap.set("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close Current Editor" })
  vim.keymap.set("n", "<leader>bo", function()
    vscode.action("workbench.action.closeOtherEditors")
  end, { desc = "Close Other Editors" })

  -- LSP Actions
  vim.keymap.set("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "Rename Symbol" })
  vim.keymap.set("n", "<leader>d", function()
    vscode.action("editor.action.showHover")
  end, { desc = "Show Hover Information" })
  vim.keymap.set("n", "[d", function()
    vscode.action("editor.action.marker.prevInFiles")
  end, { desc = "Go to Previous Problem" })
  vim.keymap.set("n", "]d", function()
    vscode.action("editor.action.marker.nextInFiles")
  end, { desc = "Go to Next Problem" })
  -- NOTE: Unable to go to next error exactly in VSCode
  vim.keymap.set("n", "[e", function()
    vscode.action("editor.action.marker.prevInFiles")
  end, { desc = "Go to Previous Problem" })
  vim.keymap.set("n", "]e", function()
    vscode.action("editor.action.marker.nextInFiles")
  end, { desc = "Go to Next Problem" })
  -- NOTE: Unable to go to next warning exactly in VSCode
  vim.keymap.set("n", "[w", function()
    vscode.action("editor.action.marker.prevInFiles")
  end, { desc = "Go to Previous Problem" })
  vim.keymap.set("n", "]w", function()
    vscode.action("editor.action.marker.nextInFiles")
  end, { desc = "Go to Next Problem" })

  -- Code Formatting
  vim.keymap.set("n", "<leader>cf", function()
    vscode.action("editor.action.format")
  end, { desc = "Format Document" })

  -- File and Search Operations
  vim.keymap.set("n", "<leader><space>", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Quick Open Files" })
  vim.keymap.set("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>/", function()
    vscode.action("workbench.view.search")
  end, { desc = "Find in Files" })
  vim.keymap.set("n", "<leader>fg", function()
    vscode.action("workbench.view.search")
  end, { desc = "Find in Files" })
  vim.keymap.set("n", "<leader>sd", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Show Diagnostics Panel" })
  vim.keymap.set("n", "<leader>sl", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Show Problems List" })
  vim.keymap.set("n", "<leader>sq", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Show Quick Fix List" })

  -- Code Actions
  vim.keymap.set("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end, { desc = "Show Code Actions" })

  -- Todo Comments (requires gruntfuggly.todo-tree extension)
  vim.keymap.set("n", "<leader>st", function()
    vscode.action("workbench.view.extension.todo-tree-container")
  end, { desc = "Show Todo Tree" })

  -- File Explorer
  vim.keymap.set("n", "<leader>e", function()
    vscode.action("workbench.view.explorer")
  end, { desc = "Toggle File Explorer" })

  -- Git Integration
  vim.keymap.set("n", "[c", function()
    vscode.action("workbench.action.editor.previousChange")
  end, { desc = "Go to Previous Git Change" })
  vim.keymap.set("n", "]c", function()
    vscode.action("workbench.action.editor.nextChange")
  end, { desc = "Go to Next Git Change" })
  vim.keymap.set("n", "<leader>gq", function()
    vscode.action("workbench.view.scm")
  end, { desc = "Show Source Control Panel" })

  -- Folding (See https://github.com/vscode-neovim/vscode-neovim/issues/58)
  -- vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
  -- vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })

  vim.keymap.set("n", "zM", function()
    vscode.action("editor.foldAll")
  end, { desc = "[Folding] Fold All" })
  vim.keymap.set("n", "zR", function()
    vscode.action("editor.unfoldAll")
  end, { desc = "[Folding] Unfold All" })
  vim.keymap.set("n", "zc", function()
    vscode.action("editor.fold")
  end, { desc = "[Folding] Fold" })
  vim.keymap.set("n", "zC", function()
    vscode.action("editor.foldRecursively")
  end, { desc = "[Folding] Fold Recursively" })
  vim.keymap.set("n", "zo", function()
    vscode.action("editor.unfold")
  end, { desc = "[Folding] Unfold" })
  vim.keymap.set("n", "zO", function()
    vscode.action("editor.unfoldRecursively")
  end, { desc = "[Folding] Unfold Recursively" })
  vim.keymap.set("n", "za", function()
    vscode.action("editor.toggleFold")
  end, { desc = "[Folding] Toggle Fold" })
  vim.keymap.set("n", "<leader>z", function()
    vscode.action("editor.toggleFold")
  end, { desc = "[Folding] Toggle Fold" })
end

return M
