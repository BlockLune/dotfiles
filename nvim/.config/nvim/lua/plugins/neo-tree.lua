-- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/353
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
        },
      },
    },
    window = {
      mappings = {
        ["y"] = {
          function(state)
            local node = state.tree:get_node()
            if not node then
              print("No file or path selected")
              return
            end

            local root_dir = LazyVim.root()
            local clipboard_content = {}

            local function process_file(file_path)
              local relative_path = vim.fn.fnamemodify(file_path, ":." .. root_dir)
              local file_content = vim.fn.readfile(file_path)
              local content_str = table.concat(file_content, "\n")
              local file_result = string.format("File: %s\n\n```\n%s\n```", relative_path, content_str)
              table.insert(clipboard_content, file_result)
            end

            local function traverse_directory(dir_path)
              for _, item in ipairs(vim.fn.glob(dir_path .. "/*", false, true)) do
                if vim.fn.isdirectory(item) == 1 then
                  traverse_directory(item)
                else
                  process_file(item)
                end
              end
            end

            if node.type == "file" then
              process_file(node.path)
            elseif node.type == "directory" then
              traverse_directory(node.path)
            end

            if #clipboard_content > 0 then
              vim.fn.setreg("+", table.concat(clipboard_content, "\n\n"))
              print("Copied to clipboard")
            else
              print("No valid file or dir selected")
            end
          end,
          desc = "Copy file content to clipboard",
        },
      },
    },
  },
}
