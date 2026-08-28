return {
  "cappyzawa/trim.nvim",
  event = "BufWritePre",
  opts = {
    ft_blocklist = { "objc", "objcpp" },
  },
}
