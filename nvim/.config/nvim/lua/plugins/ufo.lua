return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
        provider_selector = function(_, _, _)
            return { "treesitter", "indent" }
        end,

        open_fold_hl_timeout = 0,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (" 󰁂 %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end,
    },

    init = function()
        vim.o.foldenable = true
        vim.o.foldcolumn = "0"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.opt.fillchars = {
            fold = " ",
            foldopen = "▾",
            foldsep = "│",
            foldclose = "▸",
        }
    end,

    config = function(_, opts)
        require("ufo").setup(opts)
        -- Ensure our ufo foldlevel is set for the buffer
        vim.api.nvim_create_autocmd("BufReadPre", {
            callback = function()
                vim.b.ufo_foldlevel = 0
            end,
        })

        ---@param num integer Set the fold level to this number
        local set_buf_foldlevel = function(num)
            vim.b.ufo_foldlevel = num
            require("ufo").closeFoldsWith(num)
        end

        ---@param num integer The amount to change the UFO fold level by
        local change_buf_foldlevel_by = function(num)
            local foldlevel = vim.b.ufo_foldlevel or 0
            -- Ensure the foldlevel can't be set negatively
            if foldlevel + num >= 0 then
                foldlevel = foldlevel + num
            else
                foldlevel = 0
            end
            set_buf_foldlevel(foldlevel)
        end

        vim.keymap.set("n", "zM", function() set_buf_foldlevel(0) end, { desc = "[UFO] Close all folds" })
        vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "[UFO] Open all folds" })

        vim.keymap.set("n", "zm", function()
            local count = vim.v.count
            if count == 0 then
                count = 1
            end
            change_buf_foldlevel_by(-count)
        end, { desc = "[UFO] Fold More" })
        vim.keymap.set("n", "zr", function()
            local count = vim.v.count
            if count == 0 then
                count = 1
            end
            change_buf_foldlevel_by(count)
        end, { desc = "[UFO] Fold Less" })
    end,
}
