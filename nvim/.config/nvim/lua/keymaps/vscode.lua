-- ---------------------
-- VSCode-NeoVim Keymaps
-- ---------------------

local M = {}

function M.setup()
  local vscode = require('vscode')

  -- Window Splits
  vim.keymap.set("n", "<leader>|", function()
    vscode.action('workbench.action.splitEditorRight')
  end, { desc = "Split Editor Right" })
  vim.keymap.set("n", "<leader>-", function()
    vscode.action('workbench.action.splitEditorDown')
  end, { desc = "Split Editor Down" })

  -- Buffer/Tab Navigation
  vim.keymap.set("n", "H", function()
    vscode.action('workbench.action.previousEditor')
  end, { desc = "Go to Previous Editor" })
  vim.keymap.set("n", "L", function()
    vscode.action('workbench.action.nextEditor')
  end, { desc = "Go to Next Editor" })
  vim.keymap.set("n", "<leader>bd", function()
    vscode.action('workbench.action.closeActiveEditor')
  end, { desc = "Close Current Editor" })
  vim.keymap.set("n", "<leader>bo", function()
    vscode.action('workbench.action.closeOtherEditors')
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
end

return M
