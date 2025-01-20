return {
  {
    {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup {
          direction = "horizontal",
        }
      end,
    },
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true, -- Automatically start saving when you open Neovim
        execution_message = {
          message = function()
            return ("AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S")
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        events = { "InsertLeave", "TextChanged" }, -- Save on insert leave or text change
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = { "gitcommit" }, -- Prevent autosave for specific filetypes
          modifiable = true,
        },
        write_all_buffers = false, -- Save only the active buffer
        debounce_delay = 135, -- Delay before saving in milliseconds
      }
    end,
  },
}
