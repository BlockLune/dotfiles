return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        restricted_keys = {
            ["j"] = {},
            ["k"] = {},
        }
    },
    config = function(_, opts)
        require("hardtime").setup(opts)

        if vim.g.vscode then
            local hardtime = require('hardtime')
            local config = require("hardtime.config").config
            local util = require("hardtime.util")

            local key_count = 0
            local last_key = ""
            local last_time = util.get_time()

            local function vscode_cursor_move(direction)
                return function()
                    local key = direction == 'up' and 'k' or 'j'

                    if not hardtime.is_plugin_enabled then
                        vim.fn['VSCodeNotify']('cursorMove', {
                            to = direction,
                            by = 'wrappedLine',
                            value = vim.v.count1
                        })
                        return
                    end

                    local curr_time = util.get_time()
                    local should_reset_key_count = curr_time - last_time > config.max_time
                    local is_different_key = config.allow_different_key and key ~= last_key

                    if key_count < config.max_count or should_reset_key_count or is_different_key then
                        if should_reset_key_count or is_different_key then
                            key_count = 1
                        else
                            key_count = key_count + 1
                        end

                        last_time = curr_time
                        last_key = key

                        vim.fn['VSCodeNotify']('cursorMove', {
                            to = direction,
                            by = 'wrappedLine',
                            value = vim.v.count1
                        })
                    else
                        if config.notification then
                            local message = "You pressed the " .. key .. " key too soon!"
                            if key == "k" then
                                message = message .. " Use [count]k or CTRL-U to scroll up."
                            elseif key == "j" then
                                message = message .. " Use [count]j or CTRL-D to scroll down."
                            end
                            util.notify(message)
                        end

                        if config.restriction_mode == "hint" then
                            vim.fn['VSCodeNotify']('cursorMove', {
                                to = direction,
                                by = 'wrappedLine',
                                value = vim.v.count1
                            })
                        end
                    end
                end
            end

            vim.keymap.set('n', 'k', vscode_cursor_move('up'), { silent = true })
            vim.keymap.set('n', 'j', vscode_cursor_move('down'), { silent = true })
        end
    end
}
