require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "dart", -- Use dart for Flutter
  },
  highlight = { enable = true },
}
