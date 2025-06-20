require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- "astro", -- npm i -g @astrojs/language-server
  "bashls", -- npm i -g bash-language-server
  "clangd",
  -- "cmake", -- pip install cmake-language-server
  "cssls",
  -- "docker_compose_language_service", -- npm i -g @microsoft/compose-language-service
  -- "gopls",
  -- "gradle_ls",
  "html",
  -- "java_language_server",
  "pyright",
  "rust_analyzer",
  -- "vue_ls", -- npm i -g @vue/language-server
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

