return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
        })

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')

        lspconfig['lua_ls'].setup({ capabilities = capabilities })

        -- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(env)
                local diagnostic_goto = function(next, severity)
                    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
                    severity = severity and vim.diagnostic.severity[severity] or nil
                    return function()
                        go({ severity = severity })
                    end
                end

                vim.keymap.set("n", "K", vim.lsp.buf.hover)
                vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = env.buf, desc = "[Code] Rename" })
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
                    { buffer = env.buf, desc = "[LSP] Show Diagnostic" })
                vim.keymap.set("n", "]d", diagnostic_goto(true), { buffer = env.buf, desc = "[LSP] Next Diagnostic" })
                vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "[LSP] Prev Diagnostic" })
                vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "[LSP] Next Error" })
                vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "[LSP] Prev Error" })
                vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "[LSP] Next Warning" })
                vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "[LSP] Prev Warning" })
            end,
        })
    end
}
