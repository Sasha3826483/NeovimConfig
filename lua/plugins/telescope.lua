-- telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➜ ",
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
    })

    telescope.load_extension("file_browser")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    
    vim.keymap.set("n", "<leader>fbrowser", function()
      require("telescope").extensions.file_browser.file_browser()
    end, { desc = "File Browser" })
    
    vim.keymap.set("n", "<leader>fbr", function()
      require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
      })
    end, { desc = "File Browser from current file" })
  end,
}
