# My NeoVim Configuration

```
.
├── init.lua                               -- Entry file, where the plugin manager lazy.nvim loaded
├── lazy-lock.json                         -- Lockfile of lazy.nvim
├── lua
│   ├── keymaps                            -- Keymaps
│   │   ├── common.lua                     -- Common keymaps
│   │   ├── neovim.lua                     -- Only loaded in NeoVim
│   │   └── vscode.lua                     -- Only loaded in VSCode (with vscode-neovim)
│   ├── options.lua                        -- NeoVim Options
│   └── plugins                            -- Plugins, should be imported in the entry file with `require`
│       ├── autopairs.lua
│       ├── blinkcmp.lua                   -- Auto completion
│       ├── bufferline.lua                 -- Show buffers as tabs
│       ├── catppuccin.lua                 -- Theme
│       ├── conform.lua                    -- Formatter
│       ├── gitsigns.lua                   -- Git related
│       ├── hardtime.lua
│       ├── hlslens.lua
│       ├── lazydev.lua
│       ├── lightbulb.lua
│       ├── lspconfig.lua                  -- LSP (with Mason)
│       ├── repeat.lua
│       ├── scrollbar.lua
│       ├── snacks.lua                     -- Tools and functions, QoL
│       ├── surround.lua
│       ├── telescope.lua
│       ├── tiny-code-action.lua
│       ├── todo-comments.lua
│       ├── tree.lua                       -- File explorer
│       ├── treesitter.lua                 -- Syntax highlight
│       ├── trim.lua
│       ├── ts-context-commentstring.lua
│       ├── ufo.lua                        -- Folding
│       ├── undotree.lua
│       ├── wakatime.lua
│       ├── whichkey.lua
│       └── yanky.lua
└── README.md
```

## References

- [Neovim Lazy Lua IDE - my simple but powerful setup (98% upvoted)](https://youtu.be/VljhZ0e9zGE)
- [Jacky-Lzx/nvim.tutorial.config](https://github.com/Jacky-Lzx/nvim.tutorial.config)
