-- ---------------------
-- NeoVim Native Keymaps
-- ---------------------

--
-- My Leader Key
--

vim.g.mapleader = " "



--
-- Window Split
--

local function get_split_actions()
    if vim.g.vscode then
        local vscode = require('vscode')
        return function()
            vscode.action('workbench.action.splitEditorRight')
        end, function()
            vscode.action('workbench.action.splitEditorDown')
        end
    else
        return ":vsp<cr>", ":sp<cr>"
    end
end

local vertical_split, horizontal_split = get_split_actions()

vim.keymap.set("n", "<leader>|", vertical_split, { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>-", horizontal_split, { desc = "Split Horizontally" })



--
-- Navigate
--

vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Navigate Left" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Navigate Down" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Navigate Up" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Navigate Right" })



--
-- Resize Window
--

vim.keymap.set("n", "<leader><up>", ":resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader><down>", ":resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader><left>", ":vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<leader><right>", ":vertical resize +2<cr>", { desc = "Increase Window Width" })



--
-- Move Lines
--

vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })



--
-- Bufferline
--

if vim.g.vscode then
    vim.keymap.set("n", "H", function()
        require('vscode').action('workbench.action.previousEditor')
    end)
    vim.keymap.set("n", "L", function()
        require('vscode').action('workbench.action.nextEditor')
    end)
    vim.keymap.set("n", "<leader>bd", function()
        require('vscode').action('workbench.action.closeActiveEditor')
    end)
    vim.keymap.set("n", "<leader>bo", function()
        require('vscode').action('workbench.action.closeOtherEditors')
    end)
else
    vim.keymap.set("n", "H", ":bprev<cr>", { desc = "Switch to Previous Buffer" })
    vim.keymap.set("n", "L", ":bnext<cr>", { desc = "Switch to Next Buffer" })
end


--
-- LSP
--

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[Code] Rename" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "[LSP] Show Diagnostic" })

vim.keymap.set("n", "[e", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "[LSP] Prev ERROR" })
vim.keymap.set("n", "]e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "[LSP] Next ERROR" })
vim.keymap.set("n", "[w", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
end, { desc = "[LSP] Prev WARNING" })
vim.keymap.set("n", "]w", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
end, { desc = "[LSP] Next WARNING" })

-- Same to the default keymaps, but with desc updated (See `:h vim.diagnostic`)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, { desc = "[LSP] Prev Diagnostic" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, { desc = "[LSP] Next Diagnostic" })



--
-- MISC
--

vim.keymap.set("i", "jk", "<esc>", { desc = "Return to Normal Mode with `jk`" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "p", "pgvy")
vim.keymap.set("n", "<leader>qq", ":qa<cr>", { desc = "Quit All" })



--
-- vscode-neovim
--

if vim.g.vscode then
    -- Telescope-like keymaps
    vim.keymap.set("n", "<leader><space>", function()
        require("vscode").action("workbench.action.quickOpen")
    end)
    vim.keymap.set("n", "<leader>ff", function()
        require("vscode").action("workbench.action.quickOpen")
    end)
    vim.keymap.set("n", "<leader>fg", function()
        require("vscode").action("workbench.view.search")
    end)

    -- Tree-like keymaps
    vim.keymap.set("n", "<leader>e", function()
        require("vscode").action("workbench.view.explorer")
    end)

    -- Conform-like keymaps
    vim.keymap.set("n", "<leader>cf", function()
        require("vscode").action("editor.action.format")
    end)
end
