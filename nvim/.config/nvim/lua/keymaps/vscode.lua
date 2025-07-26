-- ---------------------
-- VSCode-NeoVim Keymaps
-- ---------------------

local M = {}

local function single_map(key, action, desc, mode)
  vim.keymap.set(mode or "n", key, function()
    require("vscode").action(action)
  end, { desc = desc })
end

local function map(key_or_keys, action, desc, mode)
  if type(key_or_keys) == "table" then
    for _, key in ipairs(key_or_keys) do
      single_map(key, action, desc, mode)
    end
  else
    single_map(key_or_keys, action, desc, mode)
  end
end

function M.setup()
  -- Window Splits
  map("<leader>|", "workbench.action.splitEditorRight", "Split Editor Right")
  map("<leader>-", "workbench.action.splitEditorDown", "Split Editor Down")

  -- Buffer/Tab Navigation
  map("H", "workbench.action.previousEditor", "Go to Previous Editor")
  map("L", "workbench.action.nextEditor", "Go to Next Editor")
  map("<leader>bd", "workbench.action.closeActiveEditor", "Close Current Editor")
  map("<leader>bo", "workbench.action.closeOtherEditors", "Close Other Editors")

  -- LSP Actions
  map("<leader>cr", "editor.action.rename", "Rename Symbol")
  map("<leader>d", "editor.action.showHover", "Show Hover Information")
  -- NOTE: The behaviors are different between VS Code and NeoVim
  map({ "[d", "[e", "[w" }, "editor.action.marker.prevInFiles", "Go to Previous Problem")
  map({ "]d", "]e", "]w" }, "editor.action.marker.nextInFiles", "Go to Next Problem")

  -- Code Formatting
  map("<leader>cf", "editor.action.format", "Format Document")

  -- File and Search Operations
  map("<leader><space>", "workbench.action.quickOpen", "Quick Open Files")
  map("<leader>ff", "workbench.action.quickOpen", "Find Files")
  map({ "<leader>/", "<leader>fg" }, "workbench.view.search", "Find in Files")
  map({ "<leader>D", "<leader>sd" }, "workbench.actions.view.problems", "Open Diagnostics")
  map("<leader>sl", "workbench.actions.view.problems", "Show Problems List")
  map("<leader>sq", "workbench.actions.view.problems", "Show Quick Fix List")

  -- Code Actions
  map("<leader>ca", "editor.action.quickFix", "Show Code Actions")

  -- Todo Comments (requires gruntfuggly.todo-tree extension)
  map("<leader>st", "workbench.view.extension.todo-tree-container", "Show Todo Tree")

  -- File Explorer
  map("<leader>e", "workbench.view.explorer", "Toggle File Explorer")

  -- Git Integration
  map("[c", "workbench.action.editor.previousChange", "Go to Previous Git Change")
  map("]c", "workbench.action.editor.nextChange", "Go to Next Git Change")
  map("<leader>gq", "workbench.view.scm", "Show Source Control Panel")

  -- Folding (See https://github.com/vscode-neovim/vscode-neovim/issues/58)
  -- vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
  -- vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })

  map("zM", "editor.foldAll", "[Folding] Fold All")
  map("zR", "editor.unfoldAll", "[Folding] Unfold All")
  map("zc", "editor.fold", "[Folding] Fold")
  map("zC", "editor.foldRecursively", "[Folding] Fold Recursively")
  map("zo", "editor.unfold", "[Folding] Unfold")
  map("zO", "editor.unfoldRecursively", "[Folding] Unfold Recursively")
  map({ "za", "<leader>z" }, "editor.toggleFold", "[Folding] Toggle Fold")
end

return M
