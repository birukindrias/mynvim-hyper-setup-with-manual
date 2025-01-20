-- iiset leader key to space
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<C-q>", ":qa!<CR>", { noremap = true, silent = true })
-- now add the key mappings
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true, silent = true })

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Ensure this dependency is included
  },
  {
    "nvchad/nvchad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- Setup LSP for PrettierD (if you are using LSP directly)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
-- add the following to your init.lua file

-- shortcut for telescope find_files
vim.api.nvim_set_keymap("n", "<leader>ff", ":telescope find_files<cr>", { noremap = true, silent = true })

-- shortcut for telescope live_grep
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true, silent = true })
